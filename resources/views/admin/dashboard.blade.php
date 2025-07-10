@extends('layouts.admin')

@section('content')
<div class="container mt-5">
    <!-- Header Section -->
    <div class="row mb-4">
        <div class="col-12 text-center">
            <h1 class="display-4">Admin Dashboard</h1>
            <p class="lead">Welcome, Admin! Manage your products, orders, and cart items from here.</p>
        </div>
    </div>

    <!-- Cards Section -->
    <div class="row">
        <!-- Manage Products Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-white bg-primary h-100">
                <div class="card-body">
                    <div class="card-title h4">
                        <i class="bi bi-box-seam me-2"></i>Manage Products
                    </div>
                    <p class="card-text">Add, update, or delete products from your catalog.</p>
                </div>
                <div class="card-footer">
                    <a href="{{ route('admin.products.index') }}" class="text-white text-decoration-none">
                        View Products <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- Manage Orders Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-white bg-success h-100">
                <div class="card-body">
                    <div class="card-title h4">
                        <i class="bi bi-receipt me-2"></i>Manage Orders
                    </div>
                    <p class="card-text">View and manage customer orders easily.</p>
                </div>
                <div class="card-footer">
                    <a href="{{ route('admin.orders.index') }}" class="text-white text-decoration-none">
                        View Orders <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- View Cart Items Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-white bg-warning h-100">
                <div class="card-body">
                    <div class="card-title h4">
                        <i class="bi bi-cart me-2"></i>View Cart Items
                    </div>
                    <p class="card-text">Monitor cart activity and check item details.</p>
                </div>
                <div class="card-footer">
                    <a href="{{ route('admin.cart.index') }}" class="text-white text-decoration-none">
                        View Cart <i class="bi bi-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

