<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
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
        // 获取分类
        $classify = Category::selectRaw('id,title,icon')
        ->where('parent_id', $params['type'])
        ->orderBy('weigh')
        ->get()->toArray();
        
        if ($classify) {
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
                $classify[$key]['perpage'] = 5;
                $classify[$key]['totalpage'] = 0;
            }
           
            // 查询每组前五条记录
            $sql = 'SELECT a.id,a.title,a.type,a.thumbnail,a.url,a.duration,a.parent_id FROM article AS a WHERE a.parent_id IN ('.$ids.')AND (SELECT COUNT(*) FROM article AS b WHERE b.parent_id = a.parent_id AND b.id >= a.id ) <= 5 ORDER BY a.is_rec DESC,a.updated_at ASC';
            $data = DB::select($sql);
            
            // 查询每组的总条数(分页用)
            $result = Article::selectRaw('count(1) count,parent_id')
            ->whereIn('parent_id',$dynamic)
            ->groupBy('parent_id')
            ->get()->toArray();
            $result = array_column($result, null,'parent_id');
            
            foreach ($data as $val) {
                $val = collect($val)->toArray();
                $val['thumbnail'] = 'http://192.168.1.148:8005/upload/test.png';
                if (isset($classify[$val['parent_id']])) {
                    $classify[$val['parent_id']]['child'][] = $val;
                    $classify[$val['parent_id']]['totalpage'] = ceil($result[$val['parent_id']]['count']/$classify[$val['parent_id']]['perpage']);
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
            'parent'=>'required',
        ];
        $valid =  Validator::make($params,$rule);
        if ($valid->fails()) {
            return response()->json(['code'=>'-1','msg'=>'parent不能为空']);
        }
        
        $conditions = ['parent_id'=>$params['parent']];
        if (isset($params['type']) && in_array($params['type'], [0,1])) {
            $conditions['type'] = $params['type'];
        }
        
        $result = Article::selectRaw('id,title,type,thumbnail,url,duration')
        ->where($conditions)
        ->orderBy('is_rec','DESC')
        ->orderBy('updated_at')
        ->paginate(5);
        
        if (!$result->items()) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($result as &$val) {
            $val['thumbnail'] = 'http://192.168.1.148:8005/upload/test.png';
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
        
        $info = Article::selectRaw('id,title,type,created_at,img,url,content')
        ->where('id',$params['id'])
        ->first();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        $info['img'] = 'http://192.168.1.148:8005/upload/test.png';
        
        $prev = Article::where('id', '<', $params['id'])->max('id');
        $next = Article::where('id', '>', $params['id'])->min('id');
        return response()->json(['code'=>200,'data'=>['info'=>$info,'prev'=>!empty($prev) ? $prev : '','next'=>!empty($next) ? $next : '']]);
    }
    
    public function buttom(Request $request) {
        $info = Category::selectRaw('id,title,icon')
        ->where('id','<=',4)
        ->orderBy('id')
        ->get()->toArray();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        foreach ($info as &$val) {
            $val['icon'] = 'http://192.168.1.148:8005/upload/test.png';
        }
        return response()->json(['code'=>200,'data'=>$info]);
    }
}
