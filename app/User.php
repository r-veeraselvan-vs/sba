<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use Notifiable, HasApiTokens;
    use SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'social' => 'array'
    ];

    public function setEmailAttribute($value)
    {
        $this->attributes['email'] = strtolower($value);
    }

    public function isRole()
    {
        return $this->role;
    }

    public function addresses()
    {
        return $this->hasMany(Address::class, 'user_id', 'id')->orderByraw('CHAR_LENGTH(address) ASC')->where('status', '!=', 'Deleted');
    }
    
    public function social_accounts()
    {
        return $this->hasMany(SocialAccount::class);
    }
    
    public function customer()
    {
        return $this->hasOne(Customer::class, 'user_id', 'id');
    }
}
