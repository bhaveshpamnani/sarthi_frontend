import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../common/widgets/image/circular_image.dart';
import '../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../common/widgets/text/product_price.dart';
import '../../common/widgets/text/product_title_text.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class SProductMetaData extends StatelessWidget {
  const SProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & sale proce
        Row(
          children: [
            ///Sale tag
            SRoundedContainer(
              radius: SSizes.sm,
              backgroundColor: SColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: SSizes.sm, vertical: SSizes.xs),
              child: Text(
                '25%',
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
              '₹750',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: SSizes.spaceBtwItems,
            ),
            SProductPriceText(
              price: '675',
              isLarge: true,
            ),
          ],
        ),
        ///--title
        SizedBox(
          height: SSizes.spaceBtwItems / 1.5,
        ),
        SProductTitleText(title: 'Women Dress Yellow',),
        SizedBox(
          height: SSizes.spaceBtwItems / 1.5,
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
              'In Stock',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: SSizes.spaceBtwItems,
        ),

        ///Brand
        Row(
          children: [
            SCircularImage(
              image: SImages.cloth,
              width: 32,
              height: 32,
            ),
            SizedBox(width: SSizes.sm,),
            SBrandTitleTextWithVerifyIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
        SizedBox(height: SSizes.spaceBtwItems,),
        //
      ],
    );
  }
}
