import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
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
  final List<Map<String, String>> images;
  final String title;
  final String brand;
  final String price;
  final String discount;

  SProductCardVertical({
    super.key,
    required this.images,
    required this.title,
    required this.brand,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    // Fetch the first image from the list
    String? imageUrl = images.isNotEmpty ? images[0]['url']! : null; // Default to a placeholder image if no image


    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [SShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(SSizes.productImageRadius),
        color: dark ? SColors.darkerGrey : SColors.white,
      ),
      child: Column(
        children: [
          // Thumbnail, Wishlist button, Discount tag
          SRoundedContainer(
            height: 177,
            padding: const EdgeInsets.all(SSizes.md),
            backgroundColor: dark ? SColors.dark : SColors.light,
            child: Stack(
              children: [
                // Thumbnail
                Center(
                  child: SRoundedImage(
                    imageUrl: imageUrl!, // Use the provided image URL
                  ),
                ),

                // Discount tag
                Positioned(
                  top: 0,
                  child: SRoundedContainer(
                    radius: SSizes.sm,
                    backgroundColor: SColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: SSizes.sm, vertical: SSizes.xs),
                    child: Text(
                      '$discount%', // Display discount percentage
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: SColors.black),
                    ),
                  ),
                ),

                // Wishlist button (Heart icon)
                Positioned(
                  top: 0,
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
          const SizedBox(height: SSizes.spaceBtwItems / 2),

          // Product details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SProductTitleText(
                title: title, // Display product title
                smallSize: true,
              ),
              const SizedBox(height: SSizes.spaceBtwItems / 2),
              SBrandTitleTextWithVerifyIcon(title: brand), // Display product brand
              const SizedBox(height: SSizes.spaceBtwItems),
            ],
          ),
          const Spacer(),

          // Price and Add to Cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: SSizes.sm),
                child: SProductPriceText(
                  price: price, // Display product price
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: SColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SSizes.cardRadiusMd - 5),
                    bottomRight: Radius.circular(SSizes.productImageRadius - 5),
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
