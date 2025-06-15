<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalaryCalculation extends Model
{
    use HasFactory;

    protected $fillable = [
        'staff_id',
        'gross_salary',
        'basic',
        'da',
        'other_allowances',
        'hra',
        'pan_no',
        'bank',
        'account_no',
        'ifsc_code',
    ];
}
