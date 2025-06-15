<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Staff extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'department_id',
        'phone_number',
        'actual_date_of_joining',
        'date_of_incorporation_in_pf',
        'date_of_birth',
        'age',
        'wedding_day',
        'pf_or_esi',
        'supply_zone_id',
        'supply_area_id',
        'number_of_active_customers',
        'emergency_contact_name',
        'relation',
        'contact_number',
        
        'emergency_contact_name2',
        'relation2',
        'contact_number2',
        
    ];

    // rest of the model code...
}