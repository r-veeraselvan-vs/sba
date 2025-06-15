<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeliveryArea extends Model
{
    public function days()
    {
        return $this->hasMany(DeliveryDay::class, 'delivery_area_id', 'id');
    }
}
