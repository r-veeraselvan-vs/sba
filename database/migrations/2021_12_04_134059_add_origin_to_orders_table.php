<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddOriginToOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->enum('origin', ['App', 'Web', 'Bill'])->default('Web')->after('id');

            $table->unsignedBigInteger('rider_id')->nullable()->after('user_id'); // Foriegn Key
            $table->foreign('rider_id')->references('id')->on('users');

            $table->enum('rider_status', ['Pending Collection', 'On Job', 'Delivered'])->default('Pending Collection')->after('rider_id');
            $table->dateTime('pickup_time')->nullable()->after('delivery_date');
            $table->dateTime('on_job_time')->nullable()->after('pickup_time');
            $table->dateTime('delivery_time')->nullable()->after('on_job_time');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropColumn('origin');
            $table->dropColumn('rider_id');
            $table->dropColumn('rider_status');
            $table->dropColumn('pickup_time');
            $table->dropColumn('on_job_time');
            $table->dropColumn('delivery_time');
        });
    }
}
