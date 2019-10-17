<?php

namespace App\Admin\Controllers;

use App\Models\FrontendMenu;
use App\Http\Controllers\Controller;

use Encore\Admin\Layout\Content;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Grid;
use Encore\Admin\Form;
use Illuminate\Support\Arr;

class FrontendMenuController extends Controller
{
    use HasResourceActions;
    
    protected $title = 'App\Models\FrontendMenu';
    
    public function index(Content $content) {
        $content->breadcrumb(
            ['text' => '菜单管理', 'url' => '/frontend/menu'],
            ['text' => '菜单列表']
        );
        return $content
        ->header('菜单列表')
        ->body($this->grid());
    }
    
    public function create(Content $content) {
        return $content
        ->header('添加菜单')
        ->breadcrumb(
            ['text' => '菜单管理', 'url' => '/frontend/menu'],
            ['text' => '添加菜单']
        )
        ->body($this->form());
    }

    
    public function edit($id,Content $content) {
        return $content
        ->header('编辑分类')
        ->breadcrumb(
            ['text' => '文章分类', 'url' => '/frontend/menu'],
            ['text' => $id],
            ['text' => '编辑分类']
        )
        ->body($this->form()->edit($id));
    }
    
	public function show($id, Content $content)
    {
        return redirect($this->form()->resource(-1));
    }
	
    /**
     * Make a grid builder.
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new FrontendMenu);
        
        $grid->column('id', __('ID'));
        $grid->column('title', __('标题'));
        $grid->column ('position',' 显示位置')->using(['1' => '底部', '2' => '顶部']);
        $grid->column('updated_at', __('修改时间'));
        $grid->column('created_at', __('创建时间'));
        
        // 不显示查看按钮
        $grid->actions(function ($actions) {
            $actions->disableView();
        });
        
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
        $cate = new FrontendMenu;
        $form = new Form($cate);
        $form->tools(function (Form\Tools $tools) {
            // 去掉`查看`按钮
            $tools->disableView();
        });
        
        $form->text('title', __('标题'))->rules('required');
        $form->select('position', __('显示位置'))->options(['1'=>'底部','2'=>'顶部']);
        $form->text('weigh', __('权重'))->placeholder('权重由高到低');
        $form->image('icon', __('图标'))->attribute(['accept' => '.jpg,.png']);
        $form->image('icon_select', __('图标选中'))->attribute(['accept' => '.jpg,.png']);
        $form->text('seo_title', __('SEO 标题'));
        $form->textarea('seo_keyword', __('SEO 关键字'));
        $form->textarea('seo_description', __('SEO 描述'));
        return $form;
    }
}
