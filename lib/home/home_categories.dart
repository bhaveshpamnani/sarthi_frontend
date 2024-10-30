import 'package:flutter/material.dart';
import 'package:newsarthi/home/sub_cateory.dart';

import '../common/widgets/image_text/veritcal_image_text.dart';
import '../utils/constants/image_strings.dart';

class SHomeCategories extends StatelessWidget {
  const SHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SVerticalImageText(
            image: SImages.cloth,
            title: 'shoes',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SubCategoriesScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
