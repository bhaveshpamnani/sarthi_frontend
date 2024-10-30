import 'package:flutter/material.dart';

import '../../../../common/widgets/product/cart/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../common/widgets/appbar/appbar.dart';
import '../utils/constants/text_strings.dart';

class SHomeAppBar extends StatefulWidget {
  const SHomeAppBar({
    super.key,
  });

  @override
  State<SHomeAppBar> createState() => _SHomeAppBarState();
}

class _SHomeAppBarState extends State<SHomeAppBar> {
@override
  void initState() {
    // TODO: implement initState;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SAppBar(

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            STexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: SColors.grey),
          ),
          Text(
            STexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: SColors.white),
          )
        ],
      ),
      actions: const [
        SCartCounter()
      ],
    );
  }
}