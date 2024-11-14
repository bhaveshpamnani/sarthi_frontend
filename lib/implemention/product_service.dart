import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  final String baseUrl = 'http://localhost:3000/api'; // Replace with your backend URL


  //////====Admin side method ======/////
  // Create Product
  Future<Map<String, dynamic>> createProduct(Map<String, dynamic> productData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/products/add'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(productData),
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create product');
    }
  }

  // Get All Products
  Future<List<dynamic>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products/'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Get Products by Category
  Future<List<dynamic>> getProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/categoryProduct/$categoryId'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['products'];
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Get Product by ID
  Future<Map<String, dynamic>> getProductById(String productId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$productId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load product');
    }
  }

  /////=====Admin side method ======/////
  // Update Product
  Future<Map<String, dynamic>> updateProduct(String productId, Map<String, dynamic> updatedData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to update product');
    }
  }


  ////=====admin side method =====/////
  // Delete Product
  Future<Map<String, dynamic>> deleteProduct(String productId) async {
    final response = await http.delete(Uri.parse('$baseUrl/products/$productId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to delete product');
    }
  }
}
