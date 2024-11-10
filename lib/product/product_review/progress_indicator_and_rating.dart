import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/device/device_utility.dart';

class SRatingProgressIndicator extends StatelessWidget {
  const SRatingProgressIndicator({
    super.key, required this.value, required this.text,
  });

  final double value;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
          flex: 11,
          child: SizedBox(
            width:
            SDeviceUtils.getScreenWidth(context) * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              borderRadius: BorderRadius.circular(7),
              backgroundColor: SColors.grey,
              valueColor: AlwaysStoppedAnimation(
                  SColors.primaryColor),
            ),
          ),
        )
      ],
    );
  }
}