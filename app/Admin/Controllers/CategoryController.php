<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use App\Http\Controllers\Controller;

use Encore\Admin\Layout\Content;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Grid;
use Encore\Admin\Form;
use Illuminate\Support\Arr;

class CategoryController extends Controller
{
    use HasResourceActions;
    
    protected $title = 'App\Models\Category';
    
    public function index(Content $content) {
        $content->breadcrumb(
            ['text' => '文章分类', 'url' => '/category'],
            ['text' => '分类列表']
        );
        return $content
        ->header('分类列表')
        ->body($this->grid());
    }
    
    public function create(Content $content) {
        return $content
        ->header('添加分类')
        ->breadcrumb(
            ['text' => '文章分类', 'url' => '/category'],
            ['text' => '添加分类']
        )
        ->body($this->form());
    }
    
    public function edit($id,Content $content) {
        return $content
        ->header('编辑分类')
        ->breadcrumb(
            ['text' => '文章分类', 'url' => '/category'],
            ['text' => $id],
            ['text' => '编辑分类']
        )
        ->body($this->form()->edit($id));
    }
    
    /**
     * Make a grid builder.
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Category);
        
        $grid->column('id', __('ID'));
        $grid->column('title', __('标题'));
        $grid->column ('parentJoin.title',' 父ID');
        $grid->column('updated_at', __('修改时间'));
        $grid->column('created_at', __('创建时间'));
        
        // 不显示查看按钮
        $grid->actions(function ($actions) {
            $actions->disableView();
        });
        
        // filter($callback)方法用来设置表格的简单搜索框
//         $grid->filter(function ($filter) {
//             $filter->equal('title',  '标题');
//         });
        
        // 禁止查询
        $grid->disableFilter();
        
        // 禁止导出
        $grid->disableExport();
        
        // 快捷搜索
        $grid->quickSearch('id','title');
        return $grid;
    }
    
    /**
     * Make a form builder.
     * @return Form
     */
    protected function form()
    {
        $cate = new Category;
        $form = new Form($cate);
        
        $dynamic = $cate->getParentID();
        $dynamic = array_column($dynamic, null,'id');
        $dynamic = Arr::pluck($dynamic,'title','id');
        $form->select('parent_id', __('父id'))->options($dynamic);
        $form->text('title', __('标题'))->rules('required');
        $form->image('icon', __('图标'))->attribute(['accept' => '.jpg,.png']);
        $form->text('weigh', __('权重'));
        return $form;
    }
}
