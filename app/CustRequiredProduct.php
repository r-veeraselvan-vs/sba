<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CustRequiredProduct extends Model
{
    
    protected $table = 'cust_required_product';

    protected $fillable = [
        'user_id',
        'required_product',
    ];
}
