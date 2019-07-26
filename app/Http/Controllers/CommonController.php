<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Category;
use App\Models\Article;
// use ZhuiTech\BootLaravel\Helpers\RestClient;

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
        $classify = Category::selectRaw('id,title')
        ->where('parent_id', $params['type'])
        ->orderBy('weigh')
        ->get()->toArray();
        
        if ($classify) {
            $child = Article::selectRaw('id,title,type,thumbnail,url,duration')
            ->where('parent_id',$classify[0]['id'])
            ->orderBy('is_rec','DESC')
            ->orderBy('updated_at')
            ->paginate(5);
            
            foreach ($child as &$val) {
                $val['thumbnail'] = 'http://192.168.1.148:8005/upload/test.png';
            }
            $return = ['code'=>200,'data'=>['type'=>$classify,'list'=>$child->items(),'currentpage'=>$child->currentpage(),'totalpage'=>$child->lastpage()]];
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
        $return = ['code'=>200,'data'=>['list'=>$result->items(),'currentpage'=>$result->currentpage(),'totalpage'=>$result->lastpage()]];
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
        
        $info = Article::selectRaw('id,title,created_at,img,content')
        ->where('id',$params['id'])
        ->first();
        
        if (!$info) {
            return ['code'=>'-1','msg'=>'暂无数据'];
        }
        $info['img'] = 'http://192.168.1.148:8005/upload/test.png';
        return response()->json(['code'=>200,'data'=>$info]);
    }
}
