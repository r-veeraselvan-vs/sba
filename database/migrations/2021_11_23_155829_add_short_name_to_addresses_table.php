<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddShortNameToAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('addresses', function (Blueprint $table) {
            $table->string('short_name')->nullable()->after('user_id');
            $table->string('building_name')->nullable()->after('short_name');
            $table->string('route')->nullable()->after('building_name');
            $table->string('contact_number')->nullable()->after('route');
            $table->float('latitude', 12, 8)->nullable()->after('address');
            $table->float('longitude', 12, 8)->nullable()->after('latitude');
            $table->enum('default', [ 'No', 'Yes'])->default('No')->after('longitude');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('addresses', function (Blueprint $table) {
            $table->dropColumn('short_name');
            $table->dropColumn('building_name');
            $table->dropColumn('route');
            $table->dropColumn('contact_number');
            $table->dropColumn('latitude');
            $table->dropColumn('longitude');
            $table->dropColumn('default');
        });
    }
}
