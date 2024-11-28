import 'package:flutter/material.dart';
import 'package:newsarthi/common/widgets/appbar/appbar.dart'; // Adjust path as necessary
import 'package:newsarthi/common/widgets/product/product_card/product_card_vertical.dart'; // Adjust path as necessary
import 'package:newsarthi/utils/constants/sizes.dart';

import '../implemention/wishlist_service.dart';
import '../product/product_details/product_detail.dart'; // Adjust path as necessary

class WishList extends StatefulWidget {
  final String userId; // Pass userId to the page

  const WishList({Key? key, required this.userId}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  late WishlistService _wishlistService;
  List<dynamic> _wishlistItems = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _wishlistService = WishlistService();
    _fetchWishlist();
  }

  // Fetch the user's wishlist from the API
  Future<void> _fetchWishlist() async {
    final result = await _wishlistService.getUserWishlist(widget.userId);

    if (result["success"]) {
      setState(() {
        _wishlistItems = result["wishlist"];
        _isLoading = false;
        print(_wishlistItems);
      });
    } else {
      setState(() {
        _errorMessage = result["message"];
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SAppBar(
        showBackArrow: false,
        title: Text(
          "My Wishlist",

          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            :_wishlistItems.isEmpty
            ? Center(child: Text("Your wishlist is empty"))
            : Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Expanded(
                child:  GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: SSizes.defaultSpace,
                    childAspectRatio: 0.479,
                  ),
                  itemCount: _wishlistItems.length,
                  itemBuilder: (context, index) {
                    final item = _wishlistItems[index] as Map<String, dynamic>;
                    // Extract the first image URL or use a fallback
                    final String imageUrl = (item['image'] != null && item['image'].isNotEmpty)
                        ? item['image'][0]['url'] ?? 'assets/images/products/default.png'
                        : 'assets/images/products/default.png';
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              userId: "672f3987c7e2477ab91440b6",
                              productId: item['_id'],
                            ),
                          ),
                        );
                      },
                      child: SProductCardVertical(
                        title: item['name'] ?? '',
                        price: item['price']?.toString() ?? '0',
                        brand: item['brand'] ?? '',
                        images: [imageUrl] ,
                        discount: item['discount']?.toString() ?? '0',
                      ),
                    );
                  },

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
