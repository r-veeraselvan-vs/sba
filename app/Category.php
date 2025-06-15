<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Category extends Model
{
    protected $appends = ['ImageUrl', 'HomeImageUrl'];

    public function getImageUrlAttribute()
    {
        return url('public/').Storage::url('category/').$this->image;
    }

    public function getHomeImageUrlAttribute()
    {
        return url('public/').Storage::url('category/home/').$this->home_image;
    }

    public function subcategories()
    {
        return $this->hasMany(Subcategory::class, 'category_id', 'id');
    }

    // public function products()
    // {
    //     return $this->hasMany(Product::class, 'category_id', 'id')->where('status', 'Active')->orderBy('id', 'desc')->limit(80);
    // }
}
