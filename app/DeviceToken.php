<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeviceToken extends Model
{
    protected $fillable = [
        'user_id', 'device_token', 'device_type', // Add other attributes that should be mass assignable
    ];
}
