<!-- resources/views/admin/cart/index.blade.php -->
@extends('layouts.admin')

@section('content')
<div class="container my-4">
    <h2>Cart Items</h2>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>Cart ID</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price (Each)</th>
                <th>Subtotal</th>
                <th>Added On</th>
            </tr>
        </thead>
        <tbody>
            @forelse($carts as $cart)
           <tr>
            <td>{{ $cart->id }}</td>
            <td>{{ $cart->product?->name ?? 'N/A' }}</td>
            <td>{{ $cart->quantity }}</td>
            <td>{{ number_format($cart->product?->price ?? 0, 2) }}</td>
            <td>{{ number_format($cart->quantity * ($cart->product?->price ?? 0), 2) }}</td>
            <td>{{ $cart->created_at->format('d-m-Y') }}</td>
        </tr>

            @empty
            <tr>
                <td colspan="6" class="text-center">No items in cart</td>
            </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Pagination Links, if applicable -->
    <div class="d-flex justify-content-center">
        {{ $carts->links('pagination::bootstrap-5') }}
    </div>
</div>
@endsection


