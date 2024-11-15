import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/implemention/product_service.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/chip/choice_chip.dart';
import '../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../common/widgets/icon/circular_icon.dart';
import '../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../common/widgets/text/product_price.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../implemention/wishlist_service.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../product_review/product_review.dart';

class ProductDetail extends StatefulWidget {
  final String userId;
  final String productId;

  ProductDetail({Key? key, required this.userId, required this.productId}) : super(key: key);


  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductService apiService = ProductService();
  final PageController _pageController = PageController();
  Map<String, dynamic>? product;
  List<String> _imageList = [];
  List<String> sizes = [];
  List<String> colors = [];
  String? selectedSize;
  String? selectedColor;
  WishlistService wishlistService = WishlistService();
  bool isInWishlist = false;
  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
    _getWishlistStatus();
  }

  _fetchProductDetails() async {
    try {
      product = await apiService.getProductById(widget.productId);

      // Assuming each item in product['images'] has a 'url' key
      if (product != null && product!['images'] != null) {
        setState(() {
          _imageList = product!['images']
              .map<String>((image) => image['url'] as String)
              .toList();// Extract URLs from each image object
          sizes = List<String>.from(product!['sizes'] ?? []);
          colors = List<String>.from(product!['colors'] ?? []);
        });
      } else {
        setState(() {
          _imageList = []; // default to an empty list if no images found
        });
      }
    } catch (e) {
      print('Error fetching product details: $e');
    }
  }

  // Method to fetch the wishlist status
  void _getWishlistStatus() async {
    final result = await wishlistService.getWishlistStatus(widget.userId, widget.productId);
    if (result["success"]) {
      setState(() {
        isInWishlist = result["isInWishlist"];
        print("Initial isInWishlist status: $isInWishlist"); // Debug print
      });
    } else {
      print("Error fetching wishlist status: ${result["message"]}");
    }
  }

  Future<void> handleToggleWishlist() async {
    final result = await wishlistService.toggleWishlist(widget.userId, widget.productId);
    if (result["success"]) {
      setState(() {
        isInWishlist = result["isInWishlist"];
        print("Toggled isInWishlist status: $isInWishlist"); // Debug print
      });
    } else {
      print("Error toggling wishlist: ${result["message"]}");
    }
  }


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return product == null
        ? Center(child: CircularProgressIndicator())
        : Container(
            color: Colors.black38,
            child: SafeArea(
              child: Scaffold(
                ///cart add and remove
                bottomNavigationBar: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SSizes.defaultSpace - 10,
                    vertical: SSizes.defaultSpace - 15,
                  ),
                  decoration: BoxDecoration(
                    color: dark ? SColors.darkerGrey : SColors.light,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(SSizes.cardRadiusLg),
                      topLeft: Radius.circular(SSizes.cardRadiusLg),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SCircularIcon(
                            icon: Iconsax.minus,
                            backgroundColor: SColors.black,
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SSizes.spaceBtwItems,
                          ),
                          Text(
                            '1',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            width: SSizes.spaceBtwItems,
                          ),
                          SCircularIcon(
                            icon: Iconsax.add,
                            backgroundColor: SColors.black,
                            width: 40,
                            height: 40,
                            color: Colors.white,
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(SSizes.md),
                            backgroundColor: SColors.black,
                            side: BorderSide(color: SColors.black)),
                        child: Text('Add to cart'),
                      ),
                    ],
                  ),
                ),

                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ///--product image slider
                      SCurvedEdgeWidget(
                        child: Container(
                          color: dark ? SColors.darkerGrey : SColors.light,
                          child: Stack(
                            children: [
                              /// PageView for the image slider
                              SizedBox(
                                height: 400,
                                child: PageView.builder(
                                  controller: _pageController,
                                  itemCount: _imageList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(
                                          SSizes.productImageRadius * 2),
                                      child: Image(
                                        image: NetworkImage(_imageList[index]),
                                      ),
                                    );
                                  },
                                ),
                              ),

                              /// SmoothPageIndicator
                              Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: SmoothPageIndicator(
                                    controller: _pageController,
                                    count: _imageList.length,
                                    effect: ExpandingDotsEffect(
                                      dotHeight: 5,
                                      dotWidth: 20,
                                      activeDotColor: SColors.primaryColor,
                                      dotColor: Colors.grey,
                                      expansionFactor: 3,
                                    ),
                                  ),
                                ),
                              ),

                              /// AppBar with action icons
                    SAppBar(
                      showBackArrow: true,
                      actions: [
                        SCircularIcon(
                          width: 40,
                          height: 40,
                          icon: Iconsax.heart5,
                          color: isInWishlist ? Colors.red : Colors.grey,
                          onPressed: handleToggleWishlist,
                        ),
                      ],
                    ),


                    ],
                          ),
                        ),
                      ),

                      ///--Product details
                      Padding(
                        padding: EdgeInsets.only(
                            right: SSizes.defaultSpace,
                            left: SSizes.defaultSpace,
                            bottom: SSizes.defaultSpace),
                        child: Column(
                          children: [
                            ///--Rating and Share Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ///Rating
                                    Icon(
                                      Iconsax.star,
                                      color: Colors.amber,
                                      size: 24,
                                    ),
                                    SizedBox(
                                      width: SSizes.spaceBtwItems / 2,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: product?['ratings']?['averageRating']?.toString() ?? 'No rating available',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                          TextSpan(
                                            text: '(${product?['ratings']?['numberOfRatings']?.toString()})' ?? 'No rating available',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                ///--Share Button
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    size: SSizes.iconMd,
                                  ),
                                ),
                              ],
                            ),

                            ///--Price ,Title,Stock,brand
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///--title
                                Text(
                                  '${product!['name']}',
                                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
                                ),

                                SizedBox(
                                  height: SSizes.spaceBtwItems / 1.5,
                                ),
                                ///Price & sale proce
                                Row(
                                  children: [
                                    ///Sale tag
                                    SRoundedContainer(
                                      radius: SSizes.sm,
                                      backgroundColor:
                                      SColors.secondary.withOpacity(0.8),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: SSizes.sm,
                                          vertical: SSizes.xs),
                                      child: Text(
                                        '${product!['discount']}%',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .apply(color: SColors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SSizes.spaceBtwItems,
                                    ),

                                    ///Price
                                    Text(
                                      '₹${product!['mrpPrice']}',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontSize: 12, // Set the desired font size
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),

                                    SizedBox(
                                      width: SSizes.spaceBtwItems,
                                    ),
                                    SProductPriceText(
                                      price: '${product!['discountPrice']}',
                                      isLarge: true,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SSizes.spaceBtwItems / 1.5,
                                ),


                                ///Fabric and brand Section
                                Row(
                                  children: [
                                    ///Fabric
                                    Row(
                                      children: [
                                        Text(
                                          'Fabric :',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        SizedBox(
                                          width: SSizes.spaceBtwItems,
                                        ),
                                        Text(
                                          '${product!['fabric']}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: SSizes.spaceBtwSections,
                                    ),

                                    ///Brand
                                    Row(
                                      children: [
                                        Text(
                                          'Brand :',
                                          style: Theme.of(context).textTheme.labelLarge,
                                        ),
                                        SizedBox(
                                          width: SSizes.spaceBtwItems,
                                        ),
                                        SBrandTitleTextWithVerifyIcon(
                                          title: '${product!['brand']}',
                                          brandTextSize: TextSizes.medium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SSizes.spaceBtwItems,
                                ),

                                ///--Stock Status
                                Row(
                                  children: [
                                    Text(
                                      'Stock :',
                                      style: Theme.of(context).textTheme.labelLarge,
                                    ),
                                    SizedBox(
                                      width: SSizes.spaceBtwItems,
                                    ),
                                    Text(
                                      product!['stock'] > 0 ? 'In Stock' : 'Out of Stock',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: product!['stock'] > 0 ? null : Colors.red,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: SSizes.spaceBtwItems,
                                ),
                                //
                              ],
                            ),

                            ///--Attributes
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Sizes Section
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SSectionHeading(
                                      title: 'Sizes',
                                      showActionButton: false,
                                    ),
                                    Wrap(
                                      spacing: 8,
                                      children: sizes.map((size) {
                                        return SChoiceChip(
                                          text: size,
                                          selected: selectedSize == size,
                                          onSelected: (isSelected) {
                                            setState(() {
                                              selectedSize = isSelected ? size : null;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),

                                /// Colors Section
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SSectionHeading(
                                      title: 'Colors',
                                      showActionButton: false,
                                    ),
                                    Wrap(
                                      spacing: 8,
                                      children: colors.map((color) {
                                        return SChoiceChip(
                                          text: color,
                                          selected: selectedColor == color,
                                          onSelected: (isSelected) {
                                            setState(() {
                                              selectedColor = isSelected ? color : null;
                                            });
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(
                              height: SSizes.spaceBtwSections,
                            ),

                            ///--Checkout button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: Text('CheckOut'),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              height: SSizes.spaceBtwSections,
                            ),

                            ///Description
                            SSectionHeading(
                              title: 'Description',
                              showActionButton: false,
                            ),
                            SizedBox(
                              height: SSizes.spaceBtwItems,
                            ),
                            ReadMoreText(
                              '${product!['description']}',
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'show more',
                              trimExpandedText: 'less',
                              moreStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                              lessStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: SSizes.spaceBtwSections,
                            ),

                            ///--Reviews
                            Divider(),
                            SizedBox(
                              height: SSizes.spaceBtwItems,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SSectionHeading(
                                  title: 'Reviews(199)',
                                  showActionButton: false,
                                ),
                                IconButton(
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductReviewScreen(),
                                      )),
                                  icon: Icon(Iconsax.arrow_right_4),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: SSizes.spaceBtwSections,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
