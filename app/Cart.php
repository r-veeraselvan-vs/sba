<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    public function product()
    {
        return $this->hasOne(Product::class, 'id', 'product_id');
    }

    public function product_price()
    {
        return $this->hasOne(ProductPrice::class, 'id', 'product_price_id');
    }
}
