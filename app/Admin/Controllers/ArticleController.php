<?php

namespace App\Admin\Controllers;

use App\Models\Article;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
// use Encore\Admin\Show;
use Illuminate\Support\Arr;
use Encore\Admin\Layout\Content;

class ArticleController extends AdminController
{
    protected $title = 'App\Models\Article';

    public function index(Content $content) {
        $content->breadcrumb(
            ['text' => '文章管理', 'url' => '/article'],
            ['text' => '分章列表']
            );
        return $content
        ->header('分章列表')
        ->body($this->grid());
    }
    
    public function create(Content $content) {
        return $content
        ->header('添加分章')
        ->breadcrumb(
            ['text' => '文章管理', 'url' => '/article'],
            ['text' => '添加分章']
        )
        ->body($this->form());
    }
    
    protected function grid()
    {
        $grid = new Grid(new Article);
        
        $grid->column('id', __('ID'));
        $grid->column('title', __('标题'));
        $grid->column('parent_id', __('父ID'));
        $grid->column('type', __('类型'));
        $grid->column('thumbnail', __('缩略图'));
        $grid->column('is_rec', __('是否推荐'));
        $grid->column('updated_at', __('修改时间'));
        $grid->column('created_at', __('创建时间'));

        // 禁止查询
        $grid->disableFilter();
        
        // 禁止导出
        $grid->disableExport();
        
        // 快捷搜索
        $grid->quickSearch('id','title');
        return $grid;
    }

//     protected function detail($id)
//     {
//         $show = new Show(Article::findOrFail($id));

//         $show->field('id', __('Id'));
//         $show->field('title', __('Title'));
//         $show->field('parent_id', __('Parent id'));
//         $show->field('type', __('Type'));
//         $show->field('thumbnail', __('Thumbnail'));
//         $show->field('img', __('Img'));
//         $show->field('url', __('Url'));
//         $show->field('content', __('Content'));
//         $show->field('is_rec', __('Is rec'));
//         $show->field('created_at', __('Created at'));
//         $show->field('updated_at', __('Updated at'));

//         return $show;
//     }

    protected function form()
    {
        $art = new Article;
        $form = new Form($art);
        $form->text('title', __('标题'));
        $dynamic = $art->getParentID();
        $dynamic = array_column($dynamic, null,'id');
        $dynamic = Arr::pluck($dynamic,'title','id');
        $form->select('parent_id', __('父id'))->options($dynamic);
        $form->select('type', __('类型'))->options(['文章','视频']);
        $form->text('thumbnail', __('缩略图'));
        $form->image('img', __('大图'));
        $form->text('url', __('视频地址'));
        $form->textarea('content', __('编辑器'));
        $form->select('is_rec', __('是否推荐'))->options(['否','是']);

        return $form;
    }
}
