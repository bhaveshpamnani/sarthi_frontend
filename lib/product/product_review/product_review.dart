import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsarthi/product/product_review/overall_product_rating.dart';
import 'package:newsarthi/product/product_review/user_review_card.dart';

import '../../../../common/widgets/product/rating/rating_indicator.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///--Appbar
      appBar: SAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      ///--body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Ratings and Reviews are verified and are from people who use the same type of product that you use'),
              SizedBox(
                height: SSizes.spaceBtwItems,
              ),

              ///Overall Product Rating

              SOverAllProductRating(),
              SRatingBarIndicator(
                rating: 4,
              ),

              Text(
                '12,611',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              ///User Review List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
