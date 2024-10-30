import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../common/widgets/custom_shapes/container/rounded_container.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import '../utils/helpers/helper_functions.dart';

class SOrderListItem extends StatelessWidget {
  const SOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return ListView.separated(
      itemBuilder: (context, index) => SRoundedContainer(
        padding: const EdgeInsets.all(SSizes.md),
        showBorder: true,
        backgroundColor: dark ? SColors.dark : SColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ///Icon
                const Icon(Icons.local_shipping_outlined),
                const SizedBox(
                  width: SSizes.spaceBtwItems / 2,
                ),

                ///Status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: SColors.primaryColor,
                              fontSizeDelta: 1,
                            ),
                      ),
                      Text('07 Nov 2024',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: SSizes.iconSm,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: SSizes.spaceBtwItems,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(
                        width: SSizes.spaceBtwItems / 2,
                      ),

                      ///Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Order Id',
                                style: Theme.of(context).textTheme.labelMedium
                            ),
                            Text('#12345',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      ///Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(
                        width: SSizes.spaceBtwItems / 2,
                      ),

                      ///Status and date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium
                            ),
                            Text('15 Nov 2024',
                                style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      itemCount: 4,
      separatorBuilder: (context, index) => const SizedBox(height: SSizes.spaceBtwItems,),
      shrinkWrap: true,
    );
  }
}
