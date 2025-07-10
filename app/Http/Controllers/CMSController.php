<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use App\Models\Product;
use App\Models\Order;
use Illuminate\Http\Request;

class CMSController extends Controller
{
    public function dashboard()
    {
        $totalProducts  = Product::count();
        $totalOrders    = Order::count();
        $totalCartItems = Cart::where('user_id', 1)->sum('quantity');
        return view('admin.dashboard', compact('totalProducts', 'totalOrders', 'totalCartItems'));
    }
    public function productList()
    {
        $products = Product::with('images')->paginate(10);
        return view('admin.products.index', compact('products'));
    }

    public function orderList()
    {
        $orders = Order::paginate(10);
        return view('admin.orders.index', compact('orders'));
    }

    public function cartList()
    {
        $carts = Cart::with('product')->where('user_id', 1)->paginate(10);
        return view('admin.cart.index', compact('carts'));
    }

    
}
