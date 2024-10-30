import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SVerticalImageText extends StatelessWidget {
  const SVerticalImageText({
    super.key,
    this.textColor = SColors.white,
    this.backgroundColor,
    this.onTap,
    required this.image,
    required this.title,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SSizes.spaceBtwItems),
        child: Column(
          children: [
            ///Circular icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(SSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? SColors.black : SColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                // color: (dark ? SColors.light : SColors.dark),
              ),
            ),
            const SizedBox(
              height: SSizes.spaceBtwItems / 2,
            ),

            ///Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}