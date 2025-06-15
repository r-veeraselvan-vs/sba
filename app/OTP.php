<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OTP extends Model
{
    protected $table = 'otps';
    
    protected $fillable = ['mobile', 'otp', 'expires_at'];

    public $timestamps = false;
}
