<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Banner extends Model
{
    protected $appends = ['ImageUrl'];

    public function getImageUrlAttribute()
    {
        return url('public/').Storage::url('banners/').$this->image;
    }
}
