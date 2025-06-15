<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HeadingController;
use App\Http\Controllers\SubHeadingController;
use App\Http\Controllers\DayBookController;
use App\Http\Controllers\GoDownDayBookController;
use App\Http\Controllers\OnlineDayBookController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('autologin', function () {
        $email = $_GET['email'];
        $user = \App\Models\User::where('email', $email)->first();
        Auth::login($user, true);
        return redirect()->intended('/heading/list');
    });
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::prefix('heading')->middleware(['auth'])->group(function(){
    Route::get('/list', [HeadingController::class, 'list'])->name('heading.list');
    Route::get('/create', [HeadingController::class, 'create'])->name('heading.create');
    Route::post('/store', [HeadingController::class, 'store'])->name('heading.store');
    Route::get('/edit/{id}',[HeadingController::class, 'edit'])->name('heading.edit');
    Route::post('/update/{id}', [HeadingController::class, 'update'])->name('heading.update');
    Route::get('/delete', [HeadingController::class, 'delete'])->name('heading.delete');
});

Route::prefix('subheading')->middleware(['auth'])->group(function(){
    Route::get('/list', [SubHeadingController::class, 'list'])->name('subheading.list');
    Route::get('/create', [SubHeadingController::class, 'create'])->name('subheading.create');
    Route::post('/store', [SubHeadingController::class, 'store'])->name('subheading.store');
    Route::get('/edit/{id}',[SubHeadingController::class, 'edit'])->name('subheading.edit');
    Route::post('/update/{id}', [SubHeadingController::class, 'update'])->name('subheading.update');
    Route::get('/delete', [SubHeadingController::class, 'delete'])->name('subheading.delete');
});

Route::prefix('daybook')->middleware(['auth'])->group(function(){
    Route::get('/list', [DayBookController::class, 'list'])->name('daybook.list');
    Route::get('/create', [DayBookController::class, 'create'])->name('daybook.create');
    Route::post('/store', [DayBookController::class, 'store'])->name('daybook.store');
    Route::get('/edit/{id}',[DayBookController::class, 'edit'])->name('daybook.edit');
    Route::post('/update/{id}', [DayBookController::class, 'update'])->name('daybook.update');
    Route::get('/delete', [DayBookController::class, 'delete'])->name('daybook.delete');

    Route::get('/filter', [DayBookController::class, 'dayBookDenominationCheck'])->name('daybook.filter');
});

Route::prefix('godown')->middleware(['auth'])->group(function(){
    Route::get('/list', [GoDownDayBookController::class, 'list'])->name('godown.list');
    Route::get('/create', [GoDownDayBookController::class, 'create'])->name('godown.create');
    Route::post('/store', [GoDownDayBookController::class, 'store'])->name('godown.store');
    Route::get('/edit/{id}',[GoDownDayBookController::class, 'edit'])->name('godown.edit');
    Route::post('/update/{id}', [GoDownDayBookController::class, 'update'])->name('godown.update');
    Route::get('/delete', [GoDownDayBookController::class, 'delete'])->name('godown.delete');

    Route::get('/filter', [GoDownDayBookController::class, 'DenominationCheck'])->name('godown.filter');
});

Route::prefix('online')->middleware(['auth'])->group(function(){
    Route::get('/list', [OnlineDayBookController::class, 'list'])->name('online.list');
    Route::get('/create', [OnlineDayBookController::class, 'create'])->name('online.create');
    Route::post('/store', [OnlineDayBookController::class, 'store'])->name('online.store');
    Route::get('/edit/{id}',[OnlineDayBookController::class, 'edit'])->name('online.edit');
    Route::post('/update/{id}', [OnlineDayBookController::class, 'update'])->name('online.update');
    Route::get('/delete', [OnlineDayBookController::class, 'delete'])->name('online.delete');

    Route::get('/filter', [OnlineDayBookController::class, 'DenominationCheck'])->name('online.filter');
});

Route::post('/user/logout', '\App\Http\Controllers\HomeController@userlogout')->name('user.logout');

