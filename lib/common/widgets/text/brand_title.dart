import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';

class SBrandTitle extends StatelessWidget {
  const SBrandTitle({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.color,
    this.brandTextSize = TextSizes.small,
    this.textAlign = TextAlign.center,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextSizes brandTextSize;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
