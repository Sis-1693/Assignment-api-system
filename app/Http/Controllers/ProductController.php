<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        return response()->json(Product::with('images')->get(), 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'price' => 'required|numeric',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);
        $product = Product::create($request->only(['name', 'price']));

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('product_images', 'public');
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_path' => $path
                ]);
            }
        }

        return response()->json([
            'message' => 'Product created successfully',
            'product' => $product->load('images')
        ], 201);
    }

    public function show($id)
    {
        return response()->json(Product::with('images')->findOrFail($id), 200);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'sometimes|required|string',
            'price' => 'sometimes|required|numeric',
            'images.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);
    
        $product = Product::findOrFail($id);
        $product->update($request->only(['name', 'price']));
        
        if ($request->filled('remove_images')) {
            foreach ($request->remove_images as $imageId) {
                $productImage = ProductImage::find($imageId);
                if ($productImage) {
                    Storage::disk('public')->delete($productImage->image_path);
                    $productImage->delete();
                }
            }
        }
        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('product_images', 'public');
                ProductImage::create([
                    'product_id' => $product->id,
                    'image_path' => $path
                ]);
            }
        }
        
    
        return response()->json([
            'message' => 'Product updated successfully',
            'product' => $product->load('images')
        ], 200);
    }
    

    public function destroy($id)
    {
        $product = Product::findOrFail($id);

        foreach ($product->images as $image) {
            Storage::disk('public')->delete($image->image_path);
            $image->delete();
        }

        $product->delete();

        return response()->json(['message' => 'Product deleted successfully'], 200);
    }
}
