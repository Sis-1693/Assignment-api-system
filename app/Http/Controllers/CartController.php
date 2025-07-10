<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function addToCart(Request $request) {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity'   => 'required|integer|min:1'
        ]);

        $cart = Cart::create([
            'product_id' => $request->product_id,
            'user_id'    => 1, 
            'quantity'   => $request->quantity
        ]);

        return response()->json([
            'message' => 'Product added to cart successfully',
            'cart'    => $cart
        ], 201);
    }
    public function updateCart(Request $request, $id) {
        $request->validate([
            'quantity' => 'required|integer|min:1'
        ]);
        $cart = Cart::findOrFail($id);
        
        $cart->update(['quantity' => $request->quantity]);

        return response()->json([
            'message' => 'Cart item updated successfully',
            'cart'    => $cart
        ], 200);
    }

    public function deleteCart($id) {
        $cart = Cart::findOrFail($id);
        $cart->delete();
        return response()->json(['message' => 'Cart item deleted successfully'], 200);
    }
    public function listCart() {
        $carts = Cart::with('product')->where('user_id', 1)->get();
        $total = $carts->sum(function ($item) {
            return $item->quantity * $item->product->price;
        });
        return response()->json([
            'carts' => $carts,
            'total' => $total
        ], 200);
    }
}

