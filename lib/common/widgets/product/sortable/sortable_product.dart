import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class SSortableProduct extends StatelessWidget {
  const SSortableProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.sort),
              hintText: 'Sort Product'
          ),
          items:
          ['Name', 'Higher Price', 'Lower Price', 'Newest', 'Popular']
              .map(
                (option) => DropdownMenuItem(
              value: option,
              child: Text(option),
            ),
          )
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(
          height: SSizes.spaceBtwSections,
        ),
        SGridLayout(
          itemCount: 8,
          itemBuilder: (_, index) => SProductCardVertical(),
        )
      ],
    );
  }
}