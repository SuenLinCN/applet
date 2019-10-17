<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ArticleDraft extends Model
{
    protected $table = 'article_draft';
    
    public function parentJoin() {
        $_this = new Article();
        return $_this->hasOne(Category::class,'id','parent_id');
    }
    
    // 获取父ID
    public function getParentID() {
        return Category::all(['id','title'])->toArray();
    }
    
    public function getPositionAttribute($value)
    {
        return explode(',', $value);
    }
    
    public function setPositionAttribute($value)
    {
        $this->attributes['position'] = implode(',', $value);
    }
    
    public function setDurationAttribute($value)
    {
        $this->attributes['duration'] = empty($value) ? '' : $value;
    }
    
    public function setImgAttribute($value)
    {
        $this->attributes['img'] = empty($value) ? '' : $value;
    }
    
    public function setUrlAttribute($value)
    {
        $this->attributes['url'] = empty($value) ? '' : $value;
    }
    
    public function setSeoTitleAttribute($value)
    {
        $this->attributes['seo_title'] = empty($value) ? '' : $value;
    }
    
    public function setSeoKeywordAttribute($value)
    {
        $this->attributes['seo_keyword'] = empty($value) ? '' : $value;
    }
    
    public function setSeoDescriptionAttribute($value)
    {
        $this->attributes['seo_description'] = empty($value) ? '' : $value;
    }
    
    public function setReadingAttribute($value)
    {
        $this->attributes['reading'] = implode(',', $value);
    }
    
    public function setWeighAttribute($value)
    {
        $this->attributes['weigh'] = empty($value) ? 0 : $value;
    }
}
