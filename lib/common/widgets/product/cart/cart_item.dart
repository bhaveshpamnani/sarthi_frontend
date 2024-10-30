import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../image/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class SCartItem extends StatelessWidget {
  const SCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Row(
      children: [
        ///Image
        SRoundedImage(
          imageUrl: SImages.productImage3,
          width: 85,
          height: 85,
          backgroundColor: dark ? SColors.darkerGrey : SColors.light,
          padding: const EdgeInsets.all(SSizes.sm),
        ),
        const SizedBox(
          width: SSizes.spaceBtwItems,
        ),

        ///Title , Price , & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SBrandTitleTextWithVerifyIcon(title: 'nike'),
              const Flexible(
                  child: SProductTitleText(
                title: 'Yellow Women Dresss',
                maxLines: 1,
              )),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color : ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Size : ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '34',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
