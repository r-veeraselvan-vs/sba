<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id'); // Foriegn Key
            $table->foreignId('address_id')->nullable(); // Foriegn Key
            $table->integer('items');
            $table->double('sub_total');
            $table->foreignId('promo_code_id')->nullable(); // Foriegn Key
            $table->double('discount_percent')->default(0);
            $table->double('discount_amount')->default(0);
            $table->double('tax')->default(0);
            $table->double('shipping_charge')->default(0);
            $table->double('net_amount');
            $table->date('delivery_date');
            $table->foreignId('delivery_slot_id')->nullable(); // Foriegn Key
            $table->enum('payment_mode', [ 'COD', 'Online' ])->default('COD');
            $table->double('change_required')->default(0);
            $table->enum('status', [ 'Created', 'Placed', 'Cancelled' ])->default('Created');
            $table->enum('delivery_status', [ 'Not Applicable', 'Order Received', 'Packed', 'Out for Delivery', 'Delivered' ])->default('Not Applicable');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
