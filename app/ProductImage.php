<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class ProductImage extends Model
{
    protected $appends = ['ImageUrl'];

    public function getImageUrlAttribute()
    {
        return url('public/').Storage::url('product/image/').$this->image;
    }
}
