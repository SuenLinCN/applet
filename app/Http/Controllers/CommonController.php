<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Models\FrontendMenu;
use App\Models\Category;
use App\Models\Article;
use Illuminate\Support\Arr;

class CommonController extends Controller
{

    public function __construct()
    {
//         $this->middleware('guest');
    }
    
    public function hotData(Request $request) {
        $params = $request->all();
        $rule = [
            'type'=>'required',
        ];
        
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'type不能为空']);
        }
        
        $return = [];
        // 获取caidan
        $menu = FrontendMenu::selectRaw('id,title')
		->where('position', 1)
        ->orderBy('weigh','DESC')
        ->get()->toArray();
		
		//获取分类
        $classify = Category::selectRaw('id,title,icon,`seo_title`,`seo_keyword`,`seo_description`')
        ->orderBy('weigh')
        ->get()->toArray();
        
        if ($menu) {
			$ids = '';
            $classify = array_column($classify, null,'id');
            $dynamic = array_column($classify, null,'id');
            $dynamic = Arr::pluck($dynamic,'id','id');
           
            foreach ($dynamic as $val) {
                $ids .= $val.',';
            }
            $ids = rtrim($ids,',');
            
            foreach ($classify as $key=>$val) {
                $classify[$key]['child'] = [];
                $classify[$key]['currentpage'] = 1;
                $classify[$key]['perpage'] = 9;
                $classify[$key]['totalpage'] = 0;
				
				// 查询记录
				$sql = 'SELECT a.id,a.title,a.type,a.created_at,a.thumbnail,a.url,a.duration,a.parent_id,c.title as category FROM article AS a LEFT JOIN category c ON C.id=a.parent_id WHERE a.parent_id = '. $key .' AND FIND_IN_SET("'.$params['type'].'",a.position) ORDER BY a.weigh DESC,a.updated_at DESC limit 9';
				$data = DB::select($sql);
				
				// 查询每组的总条数(分页用)
				$result = Article::selectRaw('count(1) count')
					->where('parent_id',$key)
					->first()->toArray();
				
				foreach ($data as $val) {
					$val = collect($val)->toArray();
					$val['thumbnail'] = stripos($val['thumbnail'],'http') === false ? env('APP_URL') . '/upload/' . $val['thumbnail'] : $val['thumbnail'];
					if (isset($classify[$key])) {
						$classify[$key]['child'][] = $val;
						$classify[$key]['totalpage'] = ceil($result['count']/$classify[$key]['perpage']);
					}
				}
            }
			
            $return = ['code'=>200,'data'=>array_values($classify)];
        } else {
            $return = ['code'=>'-1','msg'=>'暂无数据'];
        }
        return response()->json($return);
    }
    
    public function list(Request $request) {
        $return = [];
        $params = $request->all();
        
        $rule = [
            'position'=>'required',
        ];
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'position不能为空']);
        }
        $conditions = [];
        if (isset($params['type']) && in_array($params['type'], [0,1])) {
            $conditions['type'] = $params['type'];
        }
		
        if (isset($params['parent'])) {
            $conditions['parent_id'] = $params['parent'];
        }
        
        $result = Article::selectRaw('id,title,type,created_at,thumbnail,url,duration')
		->whereRaw('FIND_IN_SET("'.$params['position'].'",position)')
        ->where($conditions)
        ->orderByRaw('weigh DESC,updated_at DESC')
        ->paginate(9);
        
        if (!$result->items()) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($result as &$val) {
			$val['thumbnail'] = stripos($val['thumbnail'],'http') === false ? env('APP_URL') . '/upload/' . $val['thumbnail'] : $val['thumbnail'];
        }
        $return = ['code'=>200,'data'=>['list'=>$result->items(),'currentpage'=>$result->currentpage(),'perpage'=>$result->perpage(),'totalpage'=>$result->lastpage()]];
        return response()->json($return);
    }
    
    public function detail(Request $request) {
        $params = $request->all();
        $rule = [
            'id'=>'required',
        ];
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'id不能为空']);
        }
        
        $info = Article::selectRaw('`id`,`title`,`type`,`created_at`,`img`,`url`,`content`,`seo_title`,`seo_keyword`,`seo_description`')
        ->where('id',$params['id'])
        ->first();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
		$info['img'] = stripos($info['img'],'http') === false ? env('APP_URL') . '/upload/' . $info['img'] : $info['img'];
		$info['url'] = stripos($info['url'],'http') === false ? env('APP_URL') . '/upload/' . $info['url'] : $info['url'];
        
        $prev = Article::where('id', '<', $params['id'])->max('id');
        $next = Article::where('id', '>', $params['id'])->min('id');
        return response()->json(['code'=>200,'data'=>['info'=>$info,'prev'=>!empty($prev) ? $prev : '','next'=>!empty($next) ? $next : '']]);
    }
    
    public function buttom(Request $request) {
		$info = FrontendMenu::selectRaw('`id`,`title`,`icon`,`icon_select` as iconSelect,`seo_title`,`seo_keyword`,`seo_description`')
		->where('position', 1)
        ->orderBy('weigh','DESC')
        ->get()->toArray();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($info as &$val) {
            if (!empty($val['icon'])) {
                $val['icon'] = stripos($val['icon'],'http') === false ? env('APP_URL') . '/upload/' . $val['icon'] : $val['icon'];
            }
            if (!empty($val['iconSelect'])) {
                $val['iconSelect'] = stripos($val['iconSelect'],'http') === false ? env('APP_URL') . '/upload/' . $val['iconSelect'] : $val['iconSelect'];
            }
        }
        return response()->json(['code'=>200,'data'=>$info]);
    }
    
    public function reading(Request $request) {
        $params = $request->all();
        $rule = [
            'id'=>'required',
        ];
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'id不能为空']);
        }
        
        $reading = Article::selectRaw('reading')->where('id',$params['id'])->first();
        
        if (!$reading['reading']) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        
        $reading = explode(',', $reading['reading']);
        $info = Article::selectRaw('`id`,`title`,`thumbnail`,`created_at`,`type`')
        ->whereIn('id',$reading)
        ->orderByRaw('weigh DESC,updated_at DESC')
        ->get()
        ->toArray();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($info as &$val) {
            $val['thumbnail'] = stripos($val['thumbnail'],'http') === false ? env('APP_URL') . '/upload/' . $val['thumbnail'] : $val['thumbnail'];
        }
        return response()->json(['code'=>200,'data'=>['info'=>$info]]);
    }
    
    public function search(Request $request) {
        $return = [];
        $params = $request->all();
        $rule = [
            'keyword'=>'required',
        ];
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'keyword不能为空']);
        }
        
        $conditions = [];
        if (isset($params['type']) && in_array($params['type'], [0,1])) {
            $conditions['type'] = $params['type'];
        }
        
        if (isset($params['parent'])) {
            $conditions['parent_id'] = $params['parent'];
        }
        
        $result = Article::selectRaw('`id`,`title`,`thumbnail`,`created_at`,`type`')
        ->where($conditions)
        ->where('title','LIKE','%'.$params['keyword'].'%')
        ->orderByRaw('weigh DESC,updated_at DESC')
        ->paginate(9);
        
        if (!$result->items()) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($result as &$val) {
            $val['thumbnail'] = stripos($val['thumbnail'],'http') === false ? env('APP_URL') . '/upload/' . $val['thumbnail'] : $val['thumbnail'];
        }
        $return = ['code'=>200,'data'=>['list'=>$result->items(),'currentpage'=>$result->currentpage(),'perpage'=>$result->perpage(),'totalpage'=>$result->lastpage()]];
        return response()->json($return);
    }
}
