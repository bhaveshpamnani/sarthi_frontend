import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../common/widgets/product/rating/rating_indicator.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(SImages.user),
                ),
                SizedBox(
                  width: SSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(
          height: SSizes.spaceBtwItems,
        ),

        ///Review
        Row(
          children: [
            SRatingBarIndicator(rating: 4),
            SizedBox(
              width: SSizes.spaceBtwItems,
            ),
            Text(
              '01 Nav,2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'The User Interface of the app is quite intvitive. I was able to navigate and make purchase seamlessly.Great Job. ',
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primaryColor),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SColors.primaryColor),
        ),
        SizedBox(
          height: SSizes.spaceBtwItems,
        ),

        ///Company review
        SRoundedContainer(
          backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
          child: Padding(
            padding: EdgeInsets.all(SSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sarthi Store',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nav,2023',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: SSizes.spaceBtwItems,
                ),
                ReadMoreText(
                  'The User Interface of the app is quite intvitive. I was able to navigate and make purchase seamlessly.Great Job. ',
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primaryColor),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: SColors.primaryColor),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: SSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
