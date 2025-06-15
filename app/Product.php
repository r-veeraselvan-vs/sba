<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

use Auth;
use App\Wishlist;

class Product extends Model
{
    protected $appends = ['ThumbnailUrl'];

    public function getThumbnailUrlAttribute()
    {
        return url('public/').Storage::url('product/').$this->thumbnail;
    }
    
    public function wishlist()
    {
        return $this->hasOne(Wishlist::class, 'product_id', 'id');
    }
    
    public function category()
    {
        return $this->hasOne(Category::class, 'id', 'category_id');
    }
    
    public function subcategory()
    {
        return $this->hasOne(Subcategory::class, 'id', 'subcategory_id');
    }
    
    public function type()
    {
        return $this->hasOne(Type::class, 'id', 'type_id');
    }

    public function prices()
    {
        return $this->hasMany(ProductPrice::class, 'product_id', 'id')->orderBy('display_order', 'asc')->where('status', 'Active');
    }

    public function all_prices()
    {
        return $this->hasMany(ProductPrice::class, 'product_id', 'id')->orderBy('display_order', 'asc');
    }

    public function product_prices()
    {
        return $this->hasMany(ProductPrice::class, 'product_id', 'id')->orderBy('display_order', 'asc')->where('status', 'Active');
    }

    public function one_price()
    {
        return $this->hasOne(ProductPrice::class, 'product_id', 'id')->orderBy('display_order', 'asc')->where('status', 'Active');
    }

    public function specifications()
    {
        return $this->hasMany(ProductSpecification::class, 'product_id', 'id')->orderBy('display_order', 'asc');
    }

    public function features()
    {
        return $this->hasMany(ProductFeature::class, 'product_id', 'id')->orderBy('display_order', 'asc');
    }

    public function images()
    {
        return $this->hasMany(ProductImage::class, 'product_id', 'id')->orderBy('display_order', 'asc');
    }

    public function reviews()
    {
        return $this->hasMany(ProductReview::class, 'product_id', 'id')->orderBy('id', 'desc');
    }
    
    public function orderdetails()
    {
        return $this->hasMany(OrderDetail::class, 'product_id', 'id')->orderBy('id', 'desc');
    }

    public function carts()
    {
        return $this->hasMany(Cart::class, 'product_id', 'id')->orderBy('id', 'desc');
    }
    
    public function productImages()
    {
        return $this->hasMany(ProductImage::class);
    }
    
    public function productPrice()
    {
        return $this->hasOne(ProductPrice::class);
    }
}
