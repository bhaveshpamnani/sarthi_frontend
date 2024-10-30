import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SCircularContainer extends StatelessWidget {
  const SCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.child,
    this.radius = 400,
    this.padding = 0,
    this.backgroundColor = SColors.white, this.margin,
  });

  final double? width, height;
  final Widget? child;
  final double radius, padding;
  final EdgeInsets? margin;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
