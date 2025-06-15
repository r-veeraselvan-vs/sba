<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    public function shipping_rate()
    {
       return $this->hasOne(ShippingRate::class, 'id', 'shipping_rate_id');
    }
    public function address()
    {
       return $this->hasOne(Address::class, 'id', 'address_id');
    }
    public function user()
    {
       return $this->hasOne(User::class, 'id', 'user_id');
    }
    public function customer()
    {
       return $this->hasOne(User::class, 'id', 'user_id');
    }
    public function rider()
    {
       return $this->hasOne(User::class, 'id', 'rider_id');
    }
    public function order_details()
    {
       return $this->hasMany(OrderDetail::class, 'order_id', 'id');
    }
    public function order_detail()
    {
       return $this->hasOne(OrderDetail::class, 'order_id', 'id');
    }
    public function delivery_slot()
    {
       return $this->hasOne(DeliverySlot::class, 'id', 'delivery_slot_id');
    }
    public function order_pickups()
    {
       return $this->hasMany(OrderPickup::class, 'order_id', 'id');
    }
    public function order_deliveries()
    {
       return $this->hasMany(OrderDelivery::class, 'order_id', 'id');
    }
    
}
