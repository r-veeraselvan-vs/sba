<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Payslipwithpf extends Model
{
    use HasFactory;

    protected $table = 'payslipwithpf';

    protected $fillable = [
        'staff_id',
        'month',
        'total',
        'no_of_working_days',
        'per_day_salary',
        'per_hour_salary',
        'deduction_for_leave',
        'gross_salary',
        'employee_contribution_to_pf',
        'employee_contribution_to_esi',
        'net_salary',
        'net_amount',
        'pension_contribution',
        'pf_contribution',
        'edl_insurance_contribution',
        'pf_administration_charges',
        'employers_contribution_to_pf',
        'employers_contribution_to_esi',
        'total_amount_paid_to_pf',
        'total_amount_paid_to_esi',
        'incentive',
        'ot_pay',
        'holiday_pay',
        'total_cash',
        'ctc',
    ];
}

