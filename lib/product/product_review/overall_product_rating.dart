import 'package:flutter/material.dart';
import 'package:newsarthi/product/product_review/progress_indicator_and_rating.dart';

class SOverAllProductRating extends StatelessWidget {
  const SOverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.0',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              SRatingProgressIndicator(value: 0.7, text: '5',),
              SRatingProgressIndicator(value: 0.5, text: '4',),
              SRatingProgressIndicator(value: 0.3, text: '3',),
              SRatingProgressIndicator(value: 0.2, text: '2',),
              SRatingProgressIndicator(value: 0.5, text: '1',),

            ],
          ),
        )
      ],
    );
  }
}