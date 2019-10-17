<?php
namespace App\Admin\Controllers;

use Encore\Admin\Admin;
use App\Models\Article;
use App\Models\FrontendMenu;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Encore\Admin\Layout\Content;
use Encore\Admin\Controllers\HasResourceActions;
use App\Models\ArticleDraft;

class ArticleDraftController extends AdminController
{
	use HasResourceActions;
	
    protected $title = 'App\Models\ArticleDraft';
    public function index(Content $content) {
        $content->breadcrumb(
            ['text' => '文章管理', 'url' => '/article'],
            ['text' => '草稿列表']
            );
        return $content
        ->header('草稿列表')
        ->body($this->grid());
    }
    
    public function edit($id,Content $content) {
        return $content
        ->header('编辑草稿')
        ->breadcrumb(
            ['text' => '文章管理', 'url' => '/article'],
            ['text' => $id],
            ['text' => '编辑草稿']
        )
        ->body($this->form($id)->edit($id));
    }
    
    public function show($id, Content $content)
    {
        return redirect($this->form()->resource(-1));
    }
    
    protected function grid()
    {
        $grid = new Grid(new ArticleDraft);
        $prefix = config('admin.route.prefix');
        $grid->column('id', __('ID'))->sortable();
        $grid->column('title', __('标题'));
        $grid->column ('parentJoin.title',' 分类ID');
        $grid->column('type', __('类型'))->display(function ($released) {
            return $released == 0 ? '文章' : '视频';
        });
        $grid->column('thumbnail', __('缩略图'));
        $grid->column('weigh', __('排序'));
        $grid->column('position', __('推荐位'))->display(function($position){
            $data = FrontendMenu::whereIn("id",$position)->pluck('title');
            $html = "";
            foreach($data as $title){
                $html .= '<span class="label label-success">' . $title . '</span>&nbsp;';
            }
            return $html;
        });
        $grid->column('updated_at', __('修改时间'))->sortable();
        $grid->column('created_at', __('创建时间'))->sortable();

        // 不显示查看按钮
        $grid->actions(function ($actions) {
            $actions->disableView();
        });
        
        $grid->tools(function ($tools) use ($prefix) {
            $tools->append('<a href="/'.$prefix.'/article" class="btn btn-sm btn-success"><i class="fa fa-bars" style="margin-right: 5px;"></i>文章列表</a>');
        });
            
        $grid->disableCreateButton();
            
        // 禁止查询
        $grid->disableFilter();
        
        // 禁止导出
        $grid->disableExport();
        // 快捷搜索
        $grid->quickSearch('id','title');
		$grid->model()->orderby('id','desc');
        return $grid;
    }

    protected function form($id = 0)
    {
        $art = new ArticleDraft;
        $form = new Form($art);
        
        if ($id > 0) {
            $this->customIds = $id;
        }
        
        $form->tools(function (Form\Tools $tools) {
            // 去掉`查看`按钮
            $tools->disableView();
            $tools->add('<a class="btn btn-sm btn-success publish-article" style="margin-right: 5px;"><i class="fa fa-cloud-upload" style="margin-right: 5px;"></i>发布</a>');
        });

        $prefix = config('admin.route.prefix');
        
        $form->text('title', __('标题'))->rules('required');
        $dynamic = $art->getParentID();
        $dynamic = array_column($dynamic, null,'id');
        $dynamic = Arr::pluck($dynamic,'title','id');
        $form->select('parent_id', __('父id'))->options($dynamic)->rules('required');
        $form->select('type', __('类型'))->options(['文章','视频']);
        $form->multipleSelect('position',__('推荐位'))->options(FrontendMenu::all()->pluck('title', 'id'));
        $form->text('thumbnail', __('缩略图'));
        $form->text('img', __('大图'));
        $form->text('url', __('视频地址'));
        $form->text('duration', __('视频时长'));
        $form->text('weigh', __('排序'))->attribute(['placeholder' => '越大越靠前']);
        $form->multipleSelect('reading',__('相关阅读'))->options(Article::all()->where('id','<>',$id)->pluck('title', 'id'));
        $form->ckeditor('content', __('编辑器'))->required();
        $form->text('seo_title', __('SEO 标题'));
        $form->textarea('seo_keyword', __('SEO 关键字'));
        $form->textarea('seo_description', __('SEO 描述'));
        
        header("<meta name='csrf-token' content=\"{{ csrf_token() }}\">");
        Admin::script("$('.publish-article').click(function(){
            var data = [];
            var _form = $('form');
            var form = $('form').serializeArray();
            $.each(form,function(i,v){
                if(v.value != ''){
                    data.push([v.name,v.value]);
                }
            });
            data.push(['action',$('.form-horizontal').attr('action')]);
            $.ajax({
				url:'/$prefix/publish',
			    data:{data},
			    type:'POST',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name=\"csrf-token\"]').attr('content')
                },
			    success:function(data) {
                    if (data.code == 1) {
                        toastr.success(data.msg);
                        setTimeout(function(){
                            window.location.href='/$prefix/draft';
                        },1500);
                    } else{
                        toastr.error(data.msg);
                    }
			    }
			  });
        })");
        return $form;
    }
    
    public function draftDispose(Request $request) {
        $params = $request->post('data');
        if (empty($params)) {
            return ['code'=>'-1','msg'=>'未传递任何参数'];
        }
        
        $data = [];
        $tmp1 = [];
        $tmp2 = [];
        
        foreach ($params as $key=>$val) {
            if(strpos($val[0],'[') !== false){
                if ($val[0] == 'position[]') {
                    $tmp1[$key] = $val[1];
                }
                
                if ($val[0] == 'reading[]') {
                    $tmp2[$key] = $val[1];
                }
            }
            $data[$val[0]] = $val[1];
        }
        $data['reading'] = $tmp2;
        $data['position'] = $tmp1;
        
        unset($data['_token']);
        unset($data['_method']);
        unset($data['reading[]']);
        unset($data['_previous_']);
        unset($data['position[]']);
        
        $draft = new ArticleDraft;
        if (isset($data['lastId'])) {
            $existInfo = ArticleDraft::where('id', $data['lastId'])->first();
            if (!empty($existInfo)) {
                $draft = $existInfo;
            }
            unset($data['lastId']);
        }
        
        foreach($data as $key=>$val){
            $draft->$key = $val;
        }
        $draft->save();
        
        return ['code'=>'1','msg'=>'已成功保存至草稿箱','lastId'=>$draft->id];
    }
}
