<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaySlip extends Model
{
    use HasFactory;
    
    protected $table = "payslips";
    protected $fillable = [
        'staff_id',
        'month',
        'per_day_salary',
        'per_hour_salary',
        'ot_pay',
        'holiday_working_pay',
        'deduction_leave',
        'gross_salary',
        'net_salary',
        'ctc',
    ];
}
