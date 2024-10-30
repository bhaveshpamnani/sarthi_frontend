import 'package:flutter/material.dart';
import 'package:newsarthi/common/widgets/brand/brand_card.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';

class SBrandShowCase extends StatelessWidget {
  const SBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;


  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
      borderColor: SColors.darkGrey,
      showBorder: true,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
      child: Column(
        children: [
          const SBrandCard(showBorder: false),
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: SRoundedContainer(
        height: 100,
        backgroundColor: SHelperFuctions.isDarkMode(context) ? SColors.darkerGrey : SColors.light,
        margin: const EdgeInsets.all(SSizes.sm),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }

}