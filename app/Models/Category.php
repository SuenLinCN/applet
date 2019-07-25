<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'category';
    
    // 获取父ID
    public function getParentID() {
        return $this->all(['id','title'])->where('id','<=',4)->toArray();
    }
}
