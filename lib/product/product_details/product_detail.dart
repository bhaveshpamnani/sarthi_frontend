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
import '../../common/widgets/text/product_title_text.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import '../product_review/product_review.dart';

class ProductDetail extends StatefulWidget {
  final String productId;
  ProductDetail({super.key, required this.productId});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductService apiService = ProductService();
  final PageController _pageController = PageController();
  Map<String, dynamic>? product;
  List<String> _imageList = [];

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
  }

  _fetchProductDetails() async {
    try {
      product = await apiService.getProductById(widget.productId);


      // Extract URLs if 'images' contains a list of maps with 'url' keys
      _imageList = (product?['images'] as List<dynamic>)
          .map((image) => image['url'] as String)
          .toList();
      setState(() {});
    } catch (e) {
      print('Error fetching product details: $e');
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
                                    color: Colors.red,
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .apply(
                                              decoration:
                                                  TextDecoration.lineThrough),
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

                                ///--title
                                SizedBox(
                                  height: SSizes.spaceBtwItems / 1.5,
                                ),
                                SProductTitleText(
                                  title: '${product!['name']}',
                                ),
                                SizedBox(
                                  height: SSizes.spaceBtwItems / 1.5,
                                ),

                                ///--Stock Status
                                Row(
                                  children: [
                                    Text(
                                      'Stock :',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    SizedBox(
                                      width: SSizes.spaceBtwItems,
                                    ),
                                    product!['stock'] > 0 ? Text(
                                      'In Stock',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ):Text(
                                      'Out of  Stock',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: SSizes.spaceBtwItems,
                                ),

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
                                  height: SSizes.spaceBtwItems,
                                ),

                                ///Brand
                                SBrandTitleTextWithVerifyIcon(
                                  title: '${product!['brand']}',
                                  brandTextSize: TextSizes.medium,
                                ),
                                SizedBox(
                                  height: SSizes.spaceBtwItems,
                                ),
                                //
                              ],
                            ),

                            ///--Attributes
                            Column(
                              children: [
                                ///Attribute
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SSectionHeading(
                                      title: 'Colors',
                                      showActionButton: false,
                                    ),
                                    SizedBox(
                                      height: SSizes.spaceBtwItems / 2,
                                    ),
                                    Wrap(
                                      children: [
                                        SChoiceChip(
                                          text: 'Green',
                                          selected: true,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: 'Blue',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: 'Red',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: 'Yellow',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SSectionHeading(
                                      title: 'Sizes',
                                      showActionButton: false,
                                    ),
                                    SizedBox(
                                      height: SSizes.spaceBtwItems / 2,
                                    ),
                                    Wrap(
                                      spacing: 8,
                                      children: [
                                        SChoiceChip(
                                          text: '28',
                                          selected: true,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: '30',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: '32',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                        SChoiceChip(
                                          text: '34',
                                          selected: false,
                                          onSelected: (value) {},
                                        ),
                                      ],
                                    )
                                  ],
                                )
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
