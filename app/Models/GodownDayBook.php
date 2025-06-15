<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\heading;
use App\Models\subheading;

class GodownDayBook extends Model
{
    use HasFactory;

    protected $fillable = [
        'heading_id',
        'subheading_id',
        'description_1',
        'description_2',
       'amount',
        'type',
    ];

    public function heading()
    {
        return $this->belongsTo(heading::class);
    }    

    public function subheadings()
    {
        return $this->belongsTo(subheading::class, "subheading_id", "id");
    }

    public function denominations()
    {
        return $this->belongsTo(Denomination::class);
    }
}