<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use Stripe\Stripe;
use Stripe\Charge;

class CheckoutController extends Controller
{
    public function checkout(Request $request)
    {
        
        $request->validate([
            'amount' => 'required|numeric|min:1',
            'payment_token' => 'required|string', 
        ]);

        try {
            
            Stripe::setApiKey(env('STRIPE_SECRET'));
            $charge = Charge::create([
                'amount'   => $request->amount * 100,
                'currency' => 'usd',
                'source'   => $request->payment_token,
                'description' => 'Order Payment',
            ]);
            $order = Order::create([
                'user_id' => 1, 
                'total_amount' => $request->amount,
                'status' => 'completed',
            ]);
            return response()->json([
                'message' => 'Checkout successful',
                'order' => $order,
                'charge' => $charge,
            ], 200);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Payment failed',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}

