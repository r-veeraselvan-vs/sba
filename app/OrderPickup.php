<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Storage;

class OrderPickup extends Model
{
    protected $appends = ['ProofUrl'];

    public function getProofUrlAttribute()
    {
        return ($this->proof != null) ? url('/').Storage::url('order/pickup/').$this->proof : '';
    }
}
