<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    public function delivery_area()
    {
        return $this->hasOne(DeliveryArea::class, 'pin_code', 'postcode')->where('status', 'Active');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id', 'id'); 
    }
}
