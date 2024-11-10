import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/icon/circular_icon.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class SBottomAddToCart extends StatelessWidget {
  const SBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace, vertical: SSizes.defaultSpace,),
      decoration: BoxDecoration(
        color: dark ? SColors.darkerGrey : SColors.light,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(SSizes.cardRadiusLg),
          topLeft: Radius.circular(SSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: SColors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              ),
              SizedBox(
                width: SSizes.spaceBtwItems,
              ),
              Text(
                '1',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                width: SSizes.spaceBtwItems,
              ),
              SCircularIcon(
                icon: Iconsax.add,
                backgroundColor: SColors.black,
                width: 40,
                height: 40,
                color: Colors.white,
              )
            ],
          ),
          ElevatedButton(
            onPressed: () {},style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(SSizes.md),
            backgroundColor: SColors.black,
            side: BorderSide(color: SColors.black)
          ),
            child: Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
