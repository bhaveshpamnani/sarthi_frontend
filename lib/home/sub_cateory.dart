import 'package:flutter/material.dart';

import '../common/widgets/appbar/appbar.dart';
import '../common/widgets/image/rounded_image.dart';
import '../common/widgets/product/product_card/product_card_horizontal.dart';
import '../common/widgets/text/section_heading.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const SRoundedImage(
                imageUrl: SImages.banner1,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: SSizes.spaceBtwSections,
              ),

              ///Sub-category
              Column(
                children: [
                  ///Heading
                  SSectionHeading(
                    title: 'Sports T-Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SProductCardHorizontal(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              Column(
                children: [
                  ///Heading
                  SSectionHeading(
                    title: 'Sports T-Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SProductCardHorizontal(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: SSizes.spaceBtwItems,
              ),
              Column(
                children: [
                  ///Heading
                  SSectionHeading(
                    title: 'Sports T-Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: SSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: SSizes.spaceBtwItems,),
                      itemBuilder: (context, index) => const SProductCardHorizontal(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
