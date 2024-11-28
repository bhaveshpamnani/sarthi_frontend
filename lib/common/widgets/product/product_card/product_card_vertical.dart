import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadow.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icon/circular_icon.dart';
import '../../image/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_price.dart';
import '../../text/product_title_text.dart';

class SProductCardVertical extends StatefulWidget {
  final List<dynamic> images;
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
  State<SProductCardVertical> createState() => _SProductCardVerticalState();
}

class _SProductCardVerticalState extends State<SProductCardVertical> {
  @override
  Widget build(BuildContext context) {
    String? imageUrl = widget.images.isNotEmpty ? widget.images[0].toString() : null;

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [SShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(SSizes.productImageRadius),
        border: Border.all(color: SColors.grey)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SRoundedImage(
                imageUrl: imageUrl!,
                isNetworkImage: true,
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                top: 5,
                left: 5,
                child: SRoundedContainer(
                  radius: SSizes.sm,
                  backgroundColor: SColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: SSizes.sm, vertical: SSizes.xs),
                  child: Text(
                    '${widget.discount}%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: SColors.black),
                  ),
                ),
              ),
            ],
          ),
          // Product details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SProductTitleText(
                  title: widget.title,
                  smallSize: true,
                ),
                SBrandTitleTextWithVerifyIcon(title: widget.brand),
              ],
            ),
          ),
          SizedBox(height: 13,),
          // Price and Add to Cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: SSizes.sm),
                child: SProductPriceText(
                  price: widget.price,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
