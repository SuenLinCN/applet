<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UploadController extends Controller
{
    function index(Request $request)
    {
        if ($request->hasFile('upload')) {
            $file = $request->file('upload');
            $allowed_extensions = ["png", "jpg", "gif"];
            if ($file->getClientOriginalExtension() && !in_array($file->getClientOriginalExtension(), $allowed_extensions)) {
                return '图片后缀只支持png,jpg,gif,请检查！';
            }
            $destinationPath = getenv('UPLOAD_FILE_PATH');
            $extension = $file->getClientOriginalExtension();
            $fileName = md5(time()) . '.' . $extension;
            $result = $file->move($destinationPath, $fileName);
            $url = getenv('APP_URL') . '/' . $destinationPath . '/' . $fileName;
            //echo $url;
			return response()->json(['uploaded'=>1,"fileName"=>$fileName,"url"=>$url]);

        }
    }
}