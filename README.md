### Assignment API System - Overview (Laravel 9+)
This Laravel-based project is a RESTful API system designed to efficiently manage products, carts, orders, authentication, and payments. The project follows best practices, ensuring scalability, security, and maintainability.

## 1. Project Setup & Structure
- Developed using Laravel 9+ and MySQL as the database.
- Follows MVC (Model-View-Controller) architecture.
- Configured environment variables (.env) for database and app settings.
- Database backup SQL file included for quick setup.
- Postman collection provided for API testing and documentation.

## 2. Database Design & Migrations
A structured relational database is designed using migrations and seeders to manage data efficiently.

### Database Tables and Fields
- **Admins Table**: `id`, `name`, `email`, `password`, `created_at`, `updated_at`
- **Carts Table**: `id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`
- **Orders Table**: `id`, `user_id`, `total_amount`, `status`, `created_at`, `updated_at`
- **Products Table**: `id`, `name`, `price`, `created_at`, `updated_at`
- **Product Images Table**: `id`, `product_id`, `image_path`
- **Users Table**: `id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`

## 3. Authentication & Authorization
- Integrated Laravel Sanctum for API authentication.
- Developed login & registration APIs for Admin and Users.
- Implemented middleware for role-based access control (RBAC).

## 4. CRUD Operations & Business Logic

### Product Management
- API endpoints for adding, updating, deleting, and listing products.
- Implemented file upload functionality for product images.
- Used repository pattern & interfaces for clean and maintainable architecture.

### Cart & Order System
- Users can add, update, and remove products from their cart.
- Users can place orders, which are stored in the database.
- Admins can view and manage orders.

## 5. CRUD Operations in Postman

### Product API
- **Create Product**: `POST /api/products` (name, price, image)
- **Read Products**: `GET /api/products`
- **Update Product**: `PUT /api/products/{id}` (update product details)
- **Delete Product**: `DELETE /api/products/{id}`

### Cart API
- **Add to Cart**: `POST /api/cart` (user_id, product_id, quantity)
- **View Cart**: `GET /api/cart/{user_id}`
- **Update Cart**: `PUT /api/cart/{id}` (update quantity)
- **Remove from Cart**: `DELETE /api/cart/{id}`

### Order API
- **Place Order**: `POST /api/orders` (user_id, total_amount, status)
- **View Orders**: `GET /api/orders/{user_id}`
- **Update Order Status**: `PUT /api/orders/{id}` (admin updates status)
- **Delete Order**: `DELETE /api/orders/{id}`

## 6. Payment Gateway - Stripe Integration
- Stripe Payment Gateway integrated for secure online transactions.
- Users can make payments for their orders.
- Transaction details stored in the Payments Table with status (Success/Failure).

## 7. Testing & API Documentation
- Developed unit tests for key functionalities using PHPUnit.
- Postman collection provided for API documentation and testing.

## 8. Additional Features
- Soft delete functionality implemented to avoid permanent data loss.
- Laravel validation used to ensure data integrity.
- Optimized queries for better performance.

## Conclusion
This project is designed for high performance, security, and scalability. It includes authentication, CRUD operations, payment processing, and role-based access with a well-structured database.

Would you like to add more features or modifications?

