<?php

namespace App;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VendorsProduct extends Model
{
    protected $fillable = [
        'vendors_id',
        'purchase_price',
        'discount_to_customer',
        'margin_to_distribution',
        'gst',
        'hsn_code',
        'minimum_order',
        'expiry_date',
        'lot_no','item_name','quantity'
    ];

    // ...
}
