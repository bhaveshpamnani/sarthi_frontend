import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class SSingleAddress extends StatelessWidget {
  const SSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return SRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(SSizes.md),
      backgroundColor: selectedAddress
          ? SColors.primaryColor.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? SColors.darkerGrey
              : SColors.grey,
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? SColors.light
                      : SColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bhavesh Pamnani',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: SSizes.sm / 2,
              ),
              const Text(
                '+91 6353522205',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: SSizes.sm / 2,
              ),
              const Text(
                '82356 Timmy Coves,South Liana,Maine,87665,USA',
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
