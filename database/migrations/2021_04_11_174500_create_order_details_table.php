<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id'); // Foriegn Key
            $table->foreignId('user_id'); // Foriegn Key
            $table->foreignId('product_id')->constrained(); // Foriegn Key
            $table->foreignId('product_price_id')->constrained(); // Foriegn Key
            $table->double('price');
            $table->double('offer_price')->default(0);
            $table->integer('weight');
            $table->integer('quantity');
            $table->double('amount');
            $table->integer('total_weight');
            $table->double('gst_percent')->default(0);
            $table->double('gst_amount')->default(0);
            $table->double('sgst_percent')->default(0);
            $table->double('sgst_amount')->default(0);
            $table->double('cgst_percent')->default(0);
            $table->double('cgst_amount')->default(0);
            $table->double('igst_percent')->default(0);
            $table->double('igst_amount')->default(0);
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
        Schema::dropIfExists('order_details');
    }
}
