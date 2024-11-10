import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/icon/circular_icon.dart';
import '../../../../common/widgets/image/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class SImageSlider extends StatefulWidget {
  const SImageSlider({super.key});

  @override
  State<SImageSlider> createState() => _SImageSliderState();
}

class _SImageSliderState extends State<SImageSlider> {
  final PageController _pageController = PageController();

  // Sample list of images for the slider
  final List<String> _imageList = [
    SImages.productImage1,
    SImages.productImage2,
    SImages.productImage3,
    SImages.productImage4,
    SImages.productImage5,
  ];

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);

    return SCurvedEdgeWidget(
      child: Container(
        color: dark ? SColors.darkerGrey : SColors.light,
        child: Stack(
          children: [
            /// PageView for the image slider
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(SSizes.productImageRadius * 2),
                    child: Image(
                      image: AssetImage(_imageList[index]),
                    ),
                  );
                },
              ),
            ),

            /// SmoothPageIndicator
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _imageList.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 20,
                    activeDotColor: SColors.primaryColor,
                    dotColor: Colors.grey,
                    expansionFactor: 3,
                  ),
                ),
              ),
            ),

            /// AppBar with action icons
            SAppBar(
              showBackArrow: true,
              actions: [
                SCircularIcon(
                  width: 40,
                  height: 40,
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
