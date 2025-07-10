<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function showLoginForm() {
        return view('admin.login');
    }

    public function login(Request $request) {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required|min:6',
        ]);
       
        if (Auth::guard('admin')->attempt($request->only('email', 'password'))) {
    
            return redirect()->route('admin.dashboard');
        }
        return back()->withErrors([
            'email' => 'Invalid credentials. Please try again.',
        ]);
    }

    public function logout() {
        Auth::guard('admin')->logout();
        return redirect()->route('admin.login');
    }
}

