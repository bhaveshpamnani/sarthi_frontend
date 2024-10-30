import 'package:flutter/material.dart';

class SProductPriceText extends StatelessWidget {
  const SProductPriceText({
    super.key,
    required this.price,
    this.currencySign = '₹',
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String price, currencySign;
  final int maxLine;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
          decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
          decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}