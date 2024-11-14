import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product.dart';

class ProductService {
  final String baseUrl = 'https://yourapiurl.com/api';

  Future<List<Product>> fetchProductsByCategory(String categoryId) async {
    final response = await http.get(Uri.parse('$baseUrl/products?category=$categoryId'));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
