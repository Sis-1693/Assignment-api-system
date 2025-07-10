<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CMSController;
use App\Http\Controllers\Admin\Auth\LoginController;

Route::prefix('admin')->group(function () {
    Route::get('/login', [LoginController::class, 'showLoginForm'])->name('admin.login');
    Route::post('/login', [LoginController::class, 'login']);
    Route::post('/logout', [LoginController::class, 'logout'])->name('admin.logout');

    
    Route::middleware('auth:admin')->group(function () {
        Route::get('/dashboard', [CMSController::class, 'dashboard'])->name('admin.dashboard');
        Route::get('/products', [CMSController::class, 'productList'])->name('admin.products.index');
        Route::get('/orders', [CMSController::class, 'orderList'])->name('admin.orders.index');
        Route::get('/cart', [CMSController::class, 'cartList'])->name('admin.cart.index');
    });
});



