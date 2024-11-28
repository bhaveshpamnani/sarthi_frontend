import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsarthi/home/promo_slider.dart';
import 'package:newsarthi/product/product_details/product_detail.dart';

import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../common/widgets/text/section_heading.dart';
import '../implemention/product_service.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import 'home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductService _productService = ProductService();
  List<dynamic> _popularProducts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchPopularProducts();
  }

  Future<void> _fetchPopularProducts() async {
    try {
      final products = await _productService.getPopularProducts();
      setState(() {
        _popularProducts = products;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching popular products: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SPrimaryHeaderContainer(
                child: Column(
                  children: [
                    ///AppBar
                    SHomeAppBar(),
                    SizedBox(
                      height: SSizes.spaceBtwItems,
                    ),

                    ///Searchbar
                    SSearchContainer(
                      text: 'Search in Store',
                    ),
                    SizedBox(
                      height: SSizes.spaceBtwSections * 2,
                    ),
                  ],
                ),
              ),

              ///Body
              Padding(
                padding: const EdgeInsets.all(SSizes.md),
                child: Column(
                  children: [
                    const SPromoSlider(
                      banners: [
                        SImages.banner1,
                        SImages.banner2,
                        SImages.banner3,
                      ],
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwSections,
                    ),
                    SSectionHeading(
                      title: 'Popular Products',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: SSizes.spaceBtwItems,
                    ),

                    /// Display products or loading indicator
                    _isLoading
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : _popularProducts.isEmpty
                        ? const Center(
                      child: Text('No popular products found'),
                    )
                        : SGridLayout(

                      itemCount: _popularProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = _popularProducts[index];

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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
