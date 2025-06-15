<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductPricesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_prices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained(); // Foriegn Key
            $table->string('matrix1')->nullable();
            $table->string('matrix2')->nullable();
            $table->double('price');
            $table->double('offer_percentage')->default(0);
            $table->double('offer_price')->default(0);
            $table->date('start_date')->nullable();
            $table->date('end_date')->nullable();
            $table->double('retail_price')->default(0);
            $table->integer('minimum_order')->default(1);
            $table->integer('weight')->default(0);
            $table->integer('inventory')->default(0);
            $table->integer('display_order');
            $table->enum('status', [ 'Active', 'Inactive'])->default('Active');
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
        Schema::dropIfExists('product_prices');
    }
}
