<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subheading extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'heading_id',
        'status',
    ];
}
