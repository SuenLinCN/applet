<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Category;
use App\Models\Tag;
use App\Models\License;
use App\Models\Store;

/**
 * App\Models\Photo
 *
 * @property int $id
 * @property string $name 标题
 * @property string|null $description 描述
 * @property int|null $width 宽
 * @property int|null $height 高
 * @property int|null $pixel 像素
 * @property string|null $orientation vertical,horizontal,square,panoramic horizontal
 * @property string|null $color 主色调
 * @property string|null $color_type 主色调类型: color,gray
 * @property int|null $people 人数
 * @property string|null $age 年龄
 * @property string|null $sex 性别
 * @property float|null $score 平均评分
 * @property float|null $price 价格
 * @property float|null $amount 总金额
 * @property int|null $downloads_count 下载统计
 * @property int|null $views_count 查看统计
 * @property int|null $collections_count 收藏统计
 * @property string|null $status 状态
 * @property string|null $verified_at 审核时间
 * @property string|null $message 审核失败原因
 * @property int|null $user_id 上传用户
 * @property string|null $file_id 关联文件ID
 * @property string|null $file_src 文件地址
 * @property \Illuminate\Support\Carbon|null $created_at
 * @property \Illuminate\Support\Carbon|null $updated_at
 * @property \Illuminate\Support\Carbon|null $deleted_at
 * @property string $mimetype 图片类型
 * @property int $size 图片大小 bytes
 * @property int $downloads_limit 下载限制
 * @property string|null $location 地址
 * @property array|null $exif exif
 * @property float|null $longitude 经度
 * @property float|null $latitude 纬度
 * @property int $thumb_num 点赞量
 * @property int $comment_num 评论量
 * @property int $store_num 收藏量
 * @property int $is_recommend 是否推荐 0否1是
 * @property int $sort 推荐排序
 * @property string|null $dpi 照片dpi
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $answer
 * @property-read \Illuminate\Database\Eloquent\Collection|\ZhuiTech\BootLaravel\Models\User[] $cart
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Category[] $categories
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Collection[] $collections
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $comments
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $downloads
 * @property-read mixed $user
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\License[] $licenses
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $stores
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\Tag[] $tags
 * @property-read \Illuminate\Database\Eloquent\Collection|\App\Models\User[] $thumbs
 * @method static bool|null forceDelete()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo newQuery()
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Photo onlyTrashed()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo query()
 * @method static bool|null restore()
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereAge($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereAmount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereCollectionsCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereColor($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereColorType($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereCommentNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereCreatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereDeletedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereDescription($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereDownloadsCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereDownloadsLimit($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereDpi($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereExif($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereFileId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereFileSrc($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereHeight($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereIsRecommend($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereLatitude($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereLocation($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereLongitude($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereMessage($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereMimetype($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereName($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereOrientation($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo wherePeople($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo wherePixel($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo wherePrice($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereScore($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereSex($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereSize($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereSort($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereStatus($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereStoreNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereThumbNum($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereUpdatedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereUserId($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereVerifiedAt($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereViewsCount($value)
 * @method static \Illuminate\Database\Eloquent\Builder|\App\Models\Photo whereWidth($value)
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Photo withTrashed()
 * @method static \Illuminate\Database\Query\Builder|\App\Models\Photo withoutTrashed()
 * @mixin \Eloquent
 */
class Category extends Model {

    use SoftDeletes;
    use UserAttributeTrait;

    protected $table = 'photos';

    /**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];
    protected $dates = ['deleted_at'];
    protected $casts = [
        'exif' => 'array',
    ];

    public function categories() {
        $this->appends[] = 'user';
        return $this->belongsToMany(Category::class, 'category_relation', 'photo_id', 'category_id');
    }

    public function tags() {
        return $this->belongsToMany(Tag::class, 'photo_tag_relation', 'photo_id', 'tag_id');
    }

    public function licenses() {
        return $this->hasMany(License::class, 'photo_id', 'id');
    }

    public function photoReports() {
        return $this->hasone(Reports::class, 'photo_id', 'id');
    }

    public function comments() {
        return $this->belongsToMany('App\Models\User', 'Comments', 'photo_id', 'user_id');
    }

    public function answers() {
        return $this->belongsToMany('App\Models\User', 'Answers', 'photo_id', 'user_id');
    }

    public function reports() {
        return $this->belongsToMany('App\Models\User', 'Reports', 'photo_id', 'user_id');
    }

    public function collections() {
        return $this->belongsToMany('App\Models\Collection', 'collection_photos', 'photo_id', 'collection_id');
    }

    public function topics() {
        return $this->belongsToMany('App\Models\Topic', 'topic_photos', 'photo_id', 'topic_id');
    }

    public function downloads() {
        return $this->belongsToMany('App\Models\User', 'downloads', 'photo_id', 'user_id');
    }

    public function stores() {
        return $this->belongsToMany('App\Models\User', 'Stores', 'photo_id', 'user_id');
    }

    public function thumbs() {
        return $this->belongsToMany('App\Models\User', 'thumbs', 'photo_id', 'user_id');
    }

    public function faces() {
        return $this->belongsToMany('App\Models\User', 'faces', 'photo_id', 'user_id');
    }

    public function cart() {
        return $this->belongsToMany('ZhuiTech\BootLaravel\Models\User', 'carts', 'photo_id', 'user_id')
                        ->withTimestamps();
    }

    public function save(array $options = []) {
        $extends = array_only($this->attributes, ['categories', 'tags', 'licenses', 'tags_en']);
        $this->attributes = array_except($this->attributes, ['categories', 'tags', 'licenses', 'tags_en']);
        if (!empty($extends['licenses'])) {
            $this->attributes['price'] = array_get($extends['licenses'], 'basic');
        }

        // 处理Exif
        if (!empty($this->exif)) {
            $this->width = $this->exif['ImageWidth']['value'] ?? 0;
            $this->height = $this->exif['ImageHeight']['value'] ?? 0;
            $this->pixel = $this->width * $this->height;

            if ($this->width > $this->height) {
                $this->orientation = 'horizontal';
            }
            else {
                $this->orientation = 'vertical';
            }
            if ($this->width == $this->height) {
                $this->orientation = 'square';
            }
            if ($this->width >= $this->height * 2) {
                $this->orientation = 'panoramic horizontal';
            }

            $this->dpi = $this->exif['XResolution']['value'] ?? null;
        }

        // 处理Color
        if (!empty($this->color)) {
            $r = substr($this->color, 2, 2);
            $g = substr($this->color, 4, 2);
            $b = substr($this->color, 6, 2);

            if ($r == $g && $g == $b) {
                $this->color_type = 'gray';
            }
            else {
                $this->color_type = 'color';
            }
        }

        $saved = parent::save($options);

        //添加分类
        if (isset($extends['categories'])) {
            if ($this->exists) {
                $ids = array_pluck($this->categories, 'id');
                $this->categories()->detach($ids);
            }
            $categories = [];
            foreach ($extends['categories'] as $id) {
                $category = Category::find($id);
                $categories[] = $category->id;
            }
            $this->categories()->attach($categories);
        }

        //添加关键字
        if (isset($extends['tags'])) {
            if ($this->exists) {
                $ids = array_pluck($this->tags, 'id');
                $this->tags()->detach($ids);
            }
            $tags = [];
            foreach ($extends['tags'] as $key=>$word) {
                $tag = Tag::firstOrCreate(['word' => trim($word)]);
                $tag->word_en = !empty($extends['tags_en'][$key]) ? trim($extends['tags_en'][$key]) : '';
                $tag->save();
                $tags[] = $tag->id;
            }
            $this->tags()->attach($tags);
        }

        //添加授权
        if (isset($extends['licenses'])) {
            if ($this->exists) {
                foreach ($this->licenses as $license) {
                    if (isset($extends['licenses'][$license->type])) {
                        $license->price = $extends['licenses'][$license->type];
                        $license->save();
                        unset($extends['licenses'][$license->type]);
                    } else {
                        $license->delete();
                    }
                }
            }
            $licenses = [];
            foreach ($extends['licenses'] as $key => $value) {
                $licenses[] = [
                    'type' => $key,
                    'price' => $value,
                    'currency' => 'IMA',
                    'amount' => '0'
                ];
            }
            if ($licenses) {
                $this->licenses()->createMany($licenses);
            }
        }

        return $saved;
    }

    public function relevant() {
        
    }

    public function download($user) {
        
    }

}
