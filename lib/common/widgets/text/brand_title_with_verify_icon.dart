import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title.dart';

class SBrandTitleTextWithVerifyIcon extends StatelessWidget {
  const SBrandTitleTextWithVerifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = SColors.primaryColor,
    this.brandTextSize = TextSizes.small,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextSizes brandTextSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SBrandTitle(
            title: title,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            maxLines: maxLines,
          ),
        ),
        const SizedBox(
          height: SSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: SSizes.iconXs,
        ),
      ],
    );
  }
}


