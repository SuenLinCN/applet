<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateArticleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('article', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 200)->nullable()->comment('标题');
            $table->integer('parent_id')->default(0)->comment('父ID');
            $table->string('thumbnail', 100)->comment('缩略图');
            $table->string('img', 100)->comment('大图');
            $table->string('url', 100)->comment('文件地址');
            $table->mediumtext('content')->comment('编辑器');
            $table->integer('is_rec')->default(0)->comment('是否推荐 0.不推荐 1.推荐');
            $table->foreign('parent_id')->references('id')->on('category')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('article');
    }
}
