import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:newsarthi/product/product_details/product_image_slider.dart';
import 'package:newsarthi/product/product_details/product_meta_data.dart';
import 'package:newsarthi/product/product_details/rating_share.dart';
import 'package:readmore/readmore.dart';

import '../../common/widgets/chip/choice_chip.dart';
import '../../common/widgets/text/section_heading.dart';
import '../../utils/constants/sizes.dart';
import '../product_review/product_review.dart';
import 'bottom_add_to_cart.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///--product image slider
            SImageSlider(),

            ///--Product details
            Padding(
              padding: EdgeInsets.only(
                  right: SSizes.defaultSpace,
                  left: SSizes.defaultSpace,
                  bottom: SSizes.defaultSpace),
              child: Column(
                children: [
                  ///--Rating and Share Button
                  SRatingAndShare(),

                  ///--Price ,Title,Stock,brand
                  SProductMetaData(),

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
                      child: Text('Buy'),
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
                    'This is Product description for Yellow dress for women there are more things that can be added but i am just practucing and nothing else. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
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
                      SSectionHeading(title: 'Reviews(199)',showActionButton: false,),
                      IconButton(onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context) => ProductReviewScreen(),)), icon: Icon(Iconsax.arrow_right_4),),
                    ],
                  ),
                  SizedBox(height: SSizes.spaceBtwSections,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
