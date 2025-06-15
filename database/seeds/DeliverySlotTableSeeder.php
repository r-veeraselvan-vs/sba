<?php

use Illuminate\Database\Seeder;
use App\DeliverySlot;
use App\DeliveryArea;

class DeliverySlotTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $slot = DeliverySlot::where('default', 'Yes')->first();
        if(!$slot){
            $new = new DeliverySlot();
            $new->delivery_area_id  = null;
            $new->day               = 'Sunday';
            $new->start             = date('H:i:s');
            $new->end               = date('H:i:s');
            $new->deliveries        = 1000;
            $new->status            = 'Active';
            $new->default            = 'Yes';
            $new->save();
        }
    }
}
