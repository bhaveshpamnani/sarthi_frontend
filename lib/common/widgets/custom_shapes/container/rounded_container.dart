import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SRoundedContainer extends StatelessWidget {
  const SRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.radius = SSizes.cardRadiusLg,
    this.padding,
    this.backgroundColor = SColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor = SColors.primaryColor,
  });

  final double? width, height;
  final Widget? child;
  final double radius;
  final EdgeInsets? margin, padding;
  final bool showBorder;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor) : null
      ),
      child: child,
    );
  }
}
