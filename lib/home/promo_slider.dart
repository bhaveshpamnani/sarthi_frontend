import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../common/widgets/image/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SPromoSlider extends StatefulWidget {
  const SPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  _SPromoSliderState createState() => _SPromoSliderState();
}

class _SPromoSliderState extends State<SPromoSlider> {
  int _currentIndex = 0;

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.banners.map((url) => SRoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: _onPageChanged,
          ),
        ),
        const SizedBox(
          height: SSizes.spaceBtwItems,
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.banners.length,
                  (index) => SCircularContainer(
                width: 20,
                height: 3,
                backgroundColor: _currentIndex == index
                    ? SColors.primaryColor
                    : SColors.grey,
                margin: const EdgeInsets.only(right: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
