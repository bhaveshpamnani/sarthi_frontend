import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SCircularIcon extends StatelessWidget {
  const SCircularIcon({
    super.key,
    this.height,
    this.width,
    this.size = SSizes.lg ,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? height, width, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Container(
      width: width ,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
            ? SColors.black.withOpacity(0.9)
            : SColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon,color: color,size: size,),
      ),
    );
  }
}