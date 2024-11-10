import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadow.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icon/circular_icon.dart';
import '../../image/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_price.dart';
import '../../text/product_title_text.dart';

class SProductCardVertical extends StatelessWidget {
  const SProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [SShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(SSizes.productImageRadius),
        color: dark ? SColors.darkerGrey : SColors.white,
      ),
      child: Column(
        children: [
          ///Thumbnail ,Wishlist button , discount tag
          SRoundedContainer(
            height: 177,
            padding: const EdgeInsets.all(SSizes.md),
            backgroundColor: dark ? SColors.dark : SColors.light,
            child: Stack(
              children: [
                ///--Thumbnail
                const Center(
                  child: SRoundedImage(
                    imageUrl: SImages.productImage3,
                  ),
                ),

                ///--sale tag , fav button
                Positioned(
                  top: 0,
                  child: SRoundedContainer(
                    radius: SSizes.sm,
                    backgroundColor: SColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: SSizes.sm, vertical: SSizes.xs),
                    child: Text(
                      '25%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: SColors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: -7,
                  right: 0,
                  child: SCircularIcon(
                    width: 40,
                    height: 40,
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: SSizes.spaceBtwItems / 2,
          ),

          ///--details
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SProductTitleText(
                title: 'Women Dress yellow',
                smallSize: true,
              ),
              SizedBox(
                height: SSizes.spaceBtwItems / 2,
              ),
              SBrandTitleTextWithVerifyIcon(title: 'nike'),
              SizedBox(
                height: SSizes.spaceBtwItems,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: SSizes.sm),
                child: SProductPriceText(
                  price: '675',
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: SColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SSizes.cardRadiusMd - 5),
                    bottomRight:
                        Radius.circular(SSizes.productImageRadius - 5),
                  ),
                ),
                child: const SizedBox(
                  width: SSizes.iconLg * 1.2,
                  height: SSizes.iconLg * 1.2,
                  child: Center(
                    child: Icon(
                      Iconsax.add,
                      color: SColors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
