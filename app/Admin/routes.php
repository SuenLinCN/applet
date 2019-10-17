<?php
use Encore\Admin\Facades\Admin;
use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;

Admin::routes();
Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {
    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->resource('category', 'CategoryController');
    $router->resource('article', 'ArticleController');
    $router->resource('draft', 'ArticleDraftController');
    $router->resource('frontend/menu', 'FrontendMenuController');
    $router->post('dispose', 'ArticleDraftController@draftDispose');
    $router->post('publish', 'ArticleController@publishArticle');
});