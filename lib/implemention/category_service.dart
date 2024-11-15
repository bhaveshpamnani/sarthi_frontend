import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/category.dart';
import '../models/product.dart';

class CategoryService {
  static const String baseUrl = 'http://localhost:3000/api'; // Replace with your actual API URL

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['categories'];
      return jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/products/category/$categoryId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['products'];
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products for category');
    }
  }
}
