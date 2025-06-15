<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MonthlyReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'staff_id',
        'month',
        'leave_days',
        'ot_hours',
        'holiday_work_days',
        'advance_received',
    ];

    public function staff()
    {
        return $this->belongsTo(Staff::class);
    }
}
