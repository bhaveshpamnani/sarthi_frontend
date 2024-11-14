import 'package:flutter/material.dart';

import '../../../../common/widgets/brand/brand_show_case.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../common/widgets/layouts/grid_layout.dart';
import '../common/widgets/product/product_card/product_card_vertical.dart';
import '../common/widgets/text/section_heading.dart';

class SCategoryTab extends StatelessWidget {
  const SCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
             
              ///--Products
              SSectionHeading(
                title: 'You might like ',
                onPressed: () {},
                  showActionButton:false,
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              SGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const SProductCardVertical(),
              ),
              const SizedBox(
                height: SSizes.spaceBtwSections,
              )
            ],
          ),
        ),
      ],
    );
  }
}
