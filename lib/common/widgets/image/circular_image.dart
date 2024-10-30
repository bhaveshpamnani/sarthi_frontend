import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SCircularImage extends StatelessWidget {
  const SCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = SSizes.sm,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.overlayColor,
  });

  final double width, height, padding;
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? backgroundColor, overlayColor;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? SColors.dark : SColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image(
        fit: fit,
        color: overlayColor,
        image: isNetworkImage? NetworkImage(image) : AssetImage(image) as ImageProvider,
      ),
    );
  }
}
