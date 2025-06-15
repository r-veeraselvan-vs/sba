<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Notification extends Model
{
     protected $appends = ['ImageUrl'];

    public function getImageUrlAttribute()
    {
        return url('/').Storage::url('notification/').$this->image;  
    }
}
