import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import '../image/circular_image.dart';
import '../text/brand_title_with_verify_icon.dart';

class SBrandCard extends StatelessWidget {
  const SBrandCard({
    super.key, required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: SRoundedContainer(
        padding: const EdgeInsets.all(SSizes.sm),
        showBorder: showBorder,
        borderColor: dark ? SColors.white : SColors.black,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            ///--Icon
            const Flexible(
              child: SCircularImage(
                image: SImages.cloth,
              ),
            ),
            const SizedBox(
              width: SSizes.spaceBtwItems,
            ),

            ///--Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const SBrandTitleTextWithVerifyIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Product',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}