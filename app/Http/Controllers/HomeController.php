<?php

namespace App\Http\Controllers;

use App\Author;
use App\Cart;
use App\Category;
use App\Subcategory;
use App\City;
use App\Maincategory;
use App\Mainservice;
use App\ProductReview;
use App\Product;
use App\ProductPrice;
use App\Publisher;
use App\ProductAuthor;
use App\User;
use App\Banner;
use App\News;
use App\Wishlist;
use App\Settings;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;
use Auth;
use Session;

class HomeController extends Controller
{
    
    public function index()
    {
        // Fetch the last 3 products for the best sellers section
        $bestSellers = Product::with(['productImages', 'productPrice'])
            ->where('is_top_selling', 'Yes')
            ->take(3)
            ->get();

        // Fetch the first 5 products for the sweet treats section
        $sweetTreats = Product::with(['productImages', 'productPrice'])
            ->orderBy('created_at', 'asc') // Fetch the first products by creation date
            ->take(5) // Limit to 5 products
            ->get();
            
        $tangyTreasures = Product::with(['productImages', 'productPrice'])
            ->orderBy('created_at', 'asc') // Fetch by creation date in ascending order
            ->skip(5) // Skip the first 5 products
            ->take(5) // Take the next 5 products (6th to 10th)
            ->get();
            
        // Fetch the last 10 products
        $nutritiousDelights = Product::orderBy('created_at', 'desc') // Change to 'id' if necessary
            ->take(10)
            ->get();

        // Pass both products to the view
        return view('front.home', compact('bestSellers', 'sweetTreats', 'tangyTreasures', 'nutritiousDelights'));
    }

    public function productList() 
    {
        $products = Product::with(['productImages', 'productPrice'])
        ->where('is_top_selling', 'Yes')
        ->take(3)
        ->get();
        return view('front.category', compact('products'));
    }

    public function productShow($id)
    {
        $product = Product::findOrFail($id); 
        return view('front.product', compact('product')); 
    }

    public function home()
    {
        if(!Auth::user()){
            Session::put('session_id', Session::getId());
        }
        $banners = Banner::where('status', 'Active')->orderBy('display_order', 'asc')->get();
        $news = News::where('status', 'Active')->orderBy('display_order', 'asc')->get();
        $settings = Settings::first();

        $categories = Category::where('status', 'Active')->get();

        $ones = Product::where('category_id', '1')->where('show_in_home', 'Yes')->orderBy('updated_at', 'desc')->limit(8)->get();
        $twos = Product::where('category_id', '2')->where('show_in_home', 'Yes')->orderBy('updated_at', 'desc')->limit(8)->get(); 
        $threes = Product::where('category_id', '4')->where('show_in_home', 'Yes')->orderBy('updated_at', 'desc')->limit(8)->get(); 
        $fours = Product::where('category_id', '5')->where('show_in_home', 'Yes')->orderBy('updated_at', 'desc')->limit(8)->get(); 

        $one_title = Category::where('id', '1')->value('category');
        $two_title = Category::where('id', '2')->value('category');
        $three_title = Category::where('id', '4')->value('category');
        $four_title = Category::where('id', '5')->value('category');
        
        $user_id = Auth::user() ? Auth::user()->id : 0;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();

        return view('customer.front.home')->with([
            'banners' => $banners,
            'categories' => $categories,
            'ones' => $ones,
            'twos' => $twos,
            'threes' => $threes,
            'fours' => $fours,
            'one_title' => $one_title,
            'two_title' => $two_title,
            'three_title' => $three_title,
            'four_title' => $four_title,
            'wishlists' => $wishlists,
            'news' => $news,
            'settings' => $settings
        ]); 
    }

    public function products($menu, $slug = 'all', $sub_slug="all")
    {
        $p = Product::with('category', 'one_price');

        switch ($menu) {
                case 'categories':                
                    $m =  Category::with(['subcategories' => function($query) {
                        return $query->where('status', 'Active');
                    } ])->orderBy('id', 'desc');
                    // Category
                    $cat_query = Category::orderBy('id', 'desc');
                    if($slug != 'all'){ $cat_query->where('slug', $slug); }
                    $category_ids = $cat_query->pluck('id');
                    if($category_ids){
                        $p->whereIn('category_id', $category_ids);
                    }
                    // Subcategory
                    $subcat_query = Subcategory::where('status', 'Active')->orderBy('id', 'desc');
                    if($sub_slug != 'all'){ $subcat_query->where('slug', $sub_slug); }
                    $subcategory_ids = $subcat_query->pluck('id');
                    if($subcategory_ids){
                        $p->whereIn('subcategory_id', $subcategory_ids);
                    }
                break;            
            default:
                # code...
                break;
        }
        $menus = $m->where('status', 'Active')->get();
        $products = $p->where('status', 'Active')->paginate(20);
        
        if($slug == 'all'){
            $banner = '/images/shop/banner.jpg';
            $title = 'Categories';
        }else{
            $c = Category::where('slug', $slug)->first();
            $banner = $c->ImageUrl;
            $title = $c->category;
        }

        $user_id = Auth::user() ? Auth::user()->id : 0;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();

        return view('customer.front.products')->with([
            'menus' => $menus,
            'products' => $products,
            'menu' => $menu,
            'slug' => $slug,
            'sub_slug' => $sub_slug,
            'banner' => $banner,
            'title' => $title,
            'wishlists' => $wishlists
        ]); 
    }

    
    public function searchProducts(Request $request)
    {
        $search = $request->search;
        $query = Product::with('category', 'one_price');
        if($search != ''){
            $query->where('name', 'like', '%'.$search.'%');
        }
        $products = $query->where('status', 'Active')->paginate(20);

        $user_id = Auth::user() ? Auth::user()->id : 0;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();

        return view('customer.front.search')->with([
            'products' => $products,
            'search' => $search,
            'wishlists' => $wishlists
        ]); 
    }

    public function product($price_id, $slug)
    {
        if(!Auth::user()){
            Session::put('session_id', Session::getId());
        }
        
        $selected_price = ProductPrice::where('id', $price_id)->where('status', 'Active')->first();
        $product = Product::where('slug', $slug)->with(
            'category',
            'features',
            'specifications',
            'images',
            'prices'
            )->first();
            
        $matrix_ones = ProductPrice::where('product_id', $product->id)->get();
        $matrix1_array = ProductPrice::where('product_id', $product->id)->where('status', 'Active')->pluck('matrix1')->toArray();

        // carts
        $query = Cart::where('product_id', $product->id);

        $related_products = Product::where('id', '!=', $product->id)->where('subcategory_id', $product->subcategory_id)->with('category')->limit(4)->get();

        if(Auth::user()){
            $user_id = Auth::user()->id;
            $query->where('user_id', $user_id);
        }else{
            $session_id = Session::getId();
            $query->where('session_id', $session_id);
        }
        // carts

        $user_id = Auth::user() ? Auth::user()->id : 0;
        $wishlists = Wishlist::where('user_id', $user_id)->pluck('product_id')->toArray();

        return view('customer.front.product-detail')->with([
            'product' => $product,           
            'reviews' => $this->reviews($product->id),
            'selected_price' => $selected_price,
            'matrix_ones' => $matrix_ones,
            'matrix1_array' => array_unique($matrix1_array),
            'cart' => $query->first(),
            'products' => $related_products,
            'wishlists' => $wishlists
        ]);
    }

    public function reviews($id)
    {
        return ProductReview::where('product_id', $id)
                ->orderBy('id', 'desc')
                ->where('status', 'Active')
                ->get();
    }
    
     public function userlogout(Request $request) {
    
        $email  = \Auth::user()->email;
        \Auth::logout();
        // return redirect()->intended('https://maduraikadai.in/web/autologin?email='.$email.'&api_token=token');
        // return redirect()->route('email.login');
        return redirect()->route('home');

}
}
