import 'package:flutter/material.dart';

import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../implemention/category_service.dart';
import '../product/product_details/product_detail.dart';

class SCategoryTab extends StatelessWidget {
  final String categoryId;

  const SCategoryTab({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryService _categoryService = CategoryService();

    return FutureBuilder<List<dynamic>>(
      future: _categoryService.fetchProductsByCategory(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        final products = snapshot.data ?? [];

        if (products.isEmpty) {
          return const Center(child: Text("No products found"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 0.48,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            // Extract the first image URL or use a fallback
            String imageUrl = 'assets/images/products/default.png'; // Default fallback image

            if (product['images'] != null && product['images'].isNotEmpty) {
              final firstImage = product['images'][0];
              // Check if the URL is valid
              if (firstImage != null && firstImage['url'] != null) {
                final url = firstImage['url'];
                if (url.startsWith('http://') || url.startsWith('https://')) {
                  imageUrl = url; // Only use the URL if it's valid
                }
              }
            }
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(
                      userId: "672f3987c7e2477ab91440b6",
                      productId: product['_id'],
                    ),
                  ),
                );
              },
              child: SProductCardVertical(
                brand: product['brand'] ?? 'Unknown',
                title: product['name'] ?? 'No Title',
                discount: product['discount']?.toString() ?? '0',
                images: [imageUrl], // Use validated image URL
                price: product['discountPrice']?.toString() ?? '0',
              ),
            );
          },
        );
      },
    );
  }
}
