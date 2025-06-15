<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Storage;

class MobileBanner extends Model
{
    protected $appends = ['ImageUrl'];

    public function getImageUrlAttribute()
    {
        return url('public/').Storage::url('mobile-banners/').$this->image;
    }
}
