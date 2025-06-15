<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        
    
        \DB::table('users')->delete();
        
        \DB::table('users')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'Super Admin',
                'email' => 'admin@sbamadurai.com',
                'password' => Hash::make('admin@123#'),
                'mobile' => '12345678',
                'role' => 'Super Admin',
                'created_at' => '2020-10-14 17:26:08',
                'updated_at' => '2020-10-14 17:26:08',
            ),
        ));
        
        
    }
}