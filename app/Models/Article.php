<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'article';
    
    public function parentJoin() {
        return $this->hasOne(Category::class,'id','parent_id');
    }
    
    // 获取父ID
    public function getParentID() {
        return Category::all(['id','title'])->toArray();
    }
}
