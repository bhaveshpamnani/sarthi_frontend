import 'package:flutter/material.dart';
import 'package:newsarthi/common/widgets/appbar/appbar.dart'; // Adjust path as necessary
import 'package:newsarthi/common/widgets/product/product_card/product_card_vertical.dart'; // Adjust path as necessary
import 'package:newsarthi/utils/constants/sizes.dart'; // Adjust path as necessary
import 'package:newsarthi/utils/helpers/helper_functions.dart';

import '../implemention/wishlist_service.dart'; // Adjust path as necessary

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
    final dark = SHelperFuctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        showBackArrow: true,
        title: Text(
          "My Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _errorMessage.isNotEmpty
            ? Center(child: Text(_errorMessage))
            : Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              Expanded(
                child: _wishlistItems.isEmpty
                    ? Center(child: Text("Your wishlist is empty"))
                    : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SSizes.defaultSpace,
                    mainAxisSpacing: SSizes.defaultSpace,
                  ),
                  itemCount: _wishlistItems.length,
                  itemBuilder: (context, index) {
                    var item = _wishlistItems[index];
                    return SProductCardVertical(
                      title: item['name'],
                      price: item['price'],
                      brand: item['brand'],
                      images: item['image'],
                      discount: item['discount'],
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
