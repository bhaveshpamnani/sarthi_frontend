import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';

class STermAndConditionCheckBox extends StatefulWidget {
  const STermAndConditionCheckBox({
    super.key,
  });

  @override
  State<STermAndConditionCheckBox> createState() => _STermAndConditionCheckBoxState();
}

class _STermAndConditionCheckBoxState extends State<STermAndConditionCheckBox> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: InkWell(
            onTap: () {
              isCheck = !isCheck;
            },
            child: Checkbox(value: isCheck, onChanged: (value) {
              isCheck = !isCheck;
            }),
          ),
        ),
        const SizedBox(
          width: SSizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: '${STexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: STexts.privacyPolicy,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(
                    decoration: TextDecoration.underline,
                    decorationColor: dark
                        ? SColors.white
                        : SColors.primaryColor,
                    color: dark
                        ? SColors.white
                        : SColors.primaryColor),
              ),
              TextSpan(
                  text: '  And  ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: STexts.termOfUse,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(
                      decoration: TextDecoration.underline,
                      decorationColor: dark
                          ? SColors.white
                          : SColors.primaryColor,
                      color: dark
                          ? SColors.white
                          : SColors.primaryColor)),
            ],
          ),
        ),
      ],
    );
  }
}