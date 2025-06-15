<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportPayslipwithpf extends Model
{
    use HasFactory;
    protected $table = 'report_payslipwithpf';
    
    protected $fillable = [
        'staff_id',
        'uan_number',
        'name',
        'gross_salary',
        'epf_wages',
        'eps_wages',
        'edli_wages',
        'epf_contri_remitted',
        'eps_contri_remitted',
        'epf_eps_difference_remitted',
        'ncp_days',
        'refund_of_advances',
    ];
}
