<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Denomination extends Model
{
    use HasFactory;
    
      protected $fillable = [
        'front_office_daybook_id',
        'godown_daybook_id',
        'online_daybook_id',
         'amount',
        'no_of_denominations',
    ];

}
