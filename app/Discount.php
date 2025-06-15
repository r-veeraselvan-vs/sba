<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    protected $table = 'discount';

    protected $fillable = [
        'name',
        'persent',
        'nature',
        'product_id',
        'category_id',
        'author_id',
        'from_date',
        'to_date',
        'created_date',
        'updated_date',
    ];

    public $timestamps = false;

    protected $casts = [
        'product_id' => 'array',
        'category_id' => 'array',
        'author_id' => 'array',
        'from_date' => 'date',
        'to_date' => 'date',
        'created_date' => 'datetime',
        'updated_date' => 'datetime',
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_id', 'id');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'category_id', 'id');
    }

    public function authors()
    {
        return $this->belongsToMany(Author::class, 'author_id', 'id');
    }
}

