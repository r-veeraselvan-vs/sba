<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
   Route::get('send-notification', 'Api\BookingController@sendAdminNotification');

    Route::get('mark-as-read/{id}', 'Api\BookingController@markAsRead')->name('mark-as-read');

Route::group([ 'prefix' => '/' ], function () {
    
    // Authendication
    Route::post('signup', 'Api\AuthController@signup');
    Route::post('login', 'Api\AuthController@login');
    Route::post('social-login', 'Api\AuthController@socialLogin');
    
    // editProfile
    Route::match(['get', 'post'], 'editProfile', 'Api\AuthController@editProfile');
      
//     //otplogin
// Route::group(['middleware' => ['api', 'web']], function () {
//     Route::match(['get', 'post'], 'sendOTP', 'Api\AuthController@sendOTP')->name('sendOTP');  
//     Route::match(['get', 'post'], 'verifyOTP', 'Api\AuthController@verifyOTP')->name('verifyOTP');   
//     // Route::post('send-otp', [AuthController::class, 'sendOTP']);
//     // Route::post('verify-otp', [AuthController::class, 'verifyOTP']);
// });

    //otplogin
    Route::match(['get', 'post'], 'sendOTP', 'Api\AuthController@sendOTP')->name('sendOTP');  
    Route::match(['get', 'post'], 'verifyOTP', 'Api\AuthController@verifyOTP')->name('verifyOTP');   

    // OTP
    Route::get('generate-otp/{otp_type}/{user_id}', 'Api\OtpController@generateOtp');
    Route::post('verify-otp', 'Api\OtpController@verifyOtp');

    // Password
    Route::post('forgot-password', 'Api\AuthController@forgotPassword');
    Route::post('reset-password', 'Api\AuthController@resetPassword');
    Route::post('change-password', 'Api\AuthController@changePassword');
    
    // Home Page Routes
    Route::post('home-screen', 'Api\HomeScreenController@getHomeScreen');
    Route::post('products', 'Api\ProductController@getProducts');
    Route::post('product', 'Api\ProductController@getProduct');

	// Search Routes
    Route::post('home-search', 'Api\SearchController@getHomeSearch');
    Route::post('product-search', 'Api\SearchController@getProductSearch');

    // Carts
    Route::post('cart', 'Api\CartController@getCart');
    Route::post('add-cart', 'Api\CartController@addCart');
    Route::post('remove-cart', 'Api\CartController@removeCart');


    // Auth Routes
    Route::group([ 'middleware' => 'auth:api' ], function () {

        // Google map 
        Route::group([ 'prefix' => 'map' ], function () {
            Route::post('direction', 'Api\GoogleMapController@getDirections');
        });
        
        // Review
        Route::post('review', 'Api\ReviewController@review');
        
        // Logout
        Route::post('logout', 'Api\AuthController@deviceLogout');

        // Mobile Update
        Route::post('update-mobile', 'Api\AuthController@mobileUpdate');

		// Address
        Route::group([ 'prefix' => 'address' ], function () {
            Route::post('list', 'Api\AddressController@list');
            Route::post('add', 'Api\AddressController@add');
            Route::post('update', 'Api\AddressController@update');
        });

        // Booking
        Route::group(['prefix' => 'booking'], function () {
            Route::middleware('web')->group(function () {
                Route::get('/', 'Api\BookingController@booking');
                Route::match(['get', 'post'], '/update-address', 'Api\BookingController@updateAddress');
                Route::match(['get', 'post'], '/update-promocode', 'Api\BookingController@updatePromocode');
                Route::match(['get', 'post'], '/update-delivery-slot', 'Api\BookingController@updateDeliverySlot');
                Route::post('/payment', 'Api\BookingController@payment');
            });
        });

        // Order
        Route::group([ 'prefix' => 'order' ], function () {
            Route::middleware('web')->group(function () {
                Route::match(['get', 'post'], '/', 'Api\OrderController@orders');
                Route::match(['get', 'post'], '/{order_id}', 'Api\OrderController@order');
            });
        });

        // Wishlist
        Route::group([ 'prefix' => 'wishlist' ], function () {
            Route::get('/', 'Api\WishListController@wishlist');
            Route::post('/add', 'Api\WishListController@addWishlist');
        });

        // Notifications
        Route::group([ 'prefix' => 'notification' ], function () {
            Route::post('list', 'Api\NotificationController@list');
            Route::get('view/{id}', 'Api\NotificationController@view');
            Route::post('read/{id}', 'Api\NotificationController@read');
            Route::get('delete/{id}', 'Api\NotificationController@delete');
        });

        // Rider Routes
        Route::group([ 'prefix' => 'rider'], function () {
            // Order
            Route::group(['prefix' => 'order'], function () {
                Route::post('/list', 'Api\Rider\OrderController@list');
                Route::get('/{order_id}', 'Api\Rider\OrderController@view');

                // Order Update
                Route::group(['prefix' => 'update'], function () {
                    Route::post('/pickup', 'Api\Rider\OrderController@pickup');
                    Route::post('/onjob', 'Api\Rider\OrderController@onjob');
                    Route::post('/reached', 'Api\Rider\OrderController@reached');
                    Route::post('/delivered', 'Api\Rider\OrderController@delivered');
                });

                // Pickup
                Route::group(['prefix' => 'pickup'], function () {
                    Route::post('/upload', 'Api\Rider\PickupController@upload');
                    Route::get('/delete/{id}', 'Api\Rider\PickupController@delete');
                });

                // Delivery
                Route::group(['prefix' => 'delivery'], function () {
                    Route::post('/upload', 'Api\Rider\DeliveryController@upload');
                    Route::get('/delete/{id}', 'Api\Rider\DeliveryController@delete');
                });
            });
        });

    });
});