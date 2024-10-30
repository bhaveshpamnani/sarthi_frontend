import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icon/circular_icon.dart';

class SProductQualityWithAddRemoveButton extends StatelessWidget {
  const SProductQualityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SCircularIcon(
          icon: CupertinoIcons.minus,
          width: 32,
          height: 32,
          size: SSizes.md,
          color: dark ? SColors.white : SColors.black,
          backgroundColor:
          dark ? SColors.darkGrey : SColors.light,
        ),
        const SizedBox(
          width: SSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: SSizes.spaceBtwItems,
        ),
        const SCircularIcon(
          icon: CupertinoIcons.add,
          width: 32,
          height: 32,
          size: SSizes.md,
          color: SColors.white,
          backgroundColor: SColors.primaryColor,
        ),
      ],
    );
  }
}