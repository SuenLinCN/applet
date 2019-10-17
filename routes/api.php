<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('list', 'CommonController@list');           // 列表数据
Route::post('menu', 'CommonController@buttom');         // 底部菜单数据
Route::post('detail', 'CommonController@detail');       // 详情数据
Route::post('search', 'CommonController@search');       // 关键词搜索
Route::post('hotdata', 'CommonController@hotData');     // 热门数据,默认数据
Route::post('reading', 'CommonController@reading');     // 详情数据->相关阅读
