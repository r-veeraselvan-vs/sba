<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('email');
            $table->string('password')->nullable();
            $table->string('mobile')->nullable();
            $table->json('social')->nullable();
            $table->enum('role', [ 'Super Admin', 'Admin', 'Executive', 'Customer'])->default('Customer');
            $table->enum('status', [ 'Active', 'Inactive'])->default('Active');
            $table->string('mobile_otp')->nullable();
            $table->dateTime('mobile_otp_expired_at')->nullable();
            $table->enum('is_mobile_verified', [ 'Yes', 'No' ])->default('No');
            $table->string('email_otp')->nullable();
            $table->dateTime('email_otp_expired_at')->nullable();
            $table->enum('is_email_verified', [ 'Yes', 'No' ])->default('No');
            $table->unique(['email', 'deleted_at']);
            $table->softDeletes();
            $table->rememberToken();
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
        Schema::dropIfExists('users');
    }
}
