<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CartController;
use App\Models\Order;
use App\Http\Controllers\API\OrderController;
use App\Http\Controllers\API\CheckoutController;


Route::apiResource('products', ProductController::class);
Route::prefix('cart')->group(function () {
    Route::post('/add', [CartController::class, 'addToCart']);
    Route::put('/{id}', [CartController::class, 'updateCart']);
    Route::delete('/{id}', [CartController::class, 'deleteCart']);
    Route::get('/', [CartController::class, 'listCart']);
});


Route::get('/orders', [OrderController::class, 'index']); // Get all orders
Route::post('/orders', [OrderController::class, 'store']); // Create order
Route::get('/orders/{id}', [OrderController::class, 'show']); // Get order details
Route::put('/orders/{id}', [OrderController::class, 'update']); // Update order
Route::delete('/orders/{id}', [OrderController::class, 'destroy']); // Delete order

Route::post('/checkout', [CheckoutController::class, 'checkout']); // Checkout with Stripe



