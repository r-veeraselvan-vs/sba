<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->constrained(); // Foriegn Key
            $table->foreignId('subcategory_id')->constrained(); // Foriegn Key
            $table->string('name');
            $table->string('slug')->unique();
            $table->string('thumbnail');
            $table->mediumText('description')->nullable();
            $table->string('matrix1')->nullable();
            $table->string('matrix2')->nullable();
            $table->double('gst')->default(0);
            $table->double('average_ratings');
            $table->integer('ratings_count')->default(0);
            $table->enum('nonreturnable', [ 'Yes', 'No'])->default('No');
            $table->enum('status', [ 'Active', 'Inactive'])->default('Inactive');
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
        Schema::dropIfExists('products');
    }
}
