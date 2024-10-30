
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../utils/constants/colors.dart';

class SRatingBarIndicator extends StatelessWidget {
  const SRatingBarIndicator({
    super.key, required this.rating,
  });
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: 20,
      unratedColor: SColors.grey,
      itemBuilder: (context, index) => IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.star_fill,
          size: 35,
          color: SColors.primaryColor,
        ),
      ),
    );
  }
}