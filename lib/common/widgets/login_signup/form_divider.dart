import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class SFormDivider extends StatelessWidget {
  const SFormDivider({
    super.key, this.dividerText,
  });
 final dividerText;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark? SColors.darkerGrey:SColors.grey,thickness: 0.5,indent: 60,endIndent: 5,
          ),
        ),
        Text(dividerText,style: Theme.of(context).textTheme.labelMedium,),
        Flexible(
          child: Divider(
            color: dark? SColors.darkerGrey:SColors.grey,thickness: 0.5,indent: 5,endIndent: 60,
          ),
        ),
      ],
    );
  }
}