import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class STabBar extends StatelessWidget implements PreferredSizeWidget {
  const STabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return Material(
      color: dark ? SColors.black : SColors.white,
      child: Transform.translate(
        offset: Offset(-30, 0), // Shift tabs to the left
        child: TabBar(
          isScrollable: true,
          indicatorColor: SColors.primaryColor,
          unselectedLabelColor: SColors.darkGrey,
          labelColor: dark ? SColors.white : SColors.primaryColor,
          indicatorPadding: EdgeInsets.zero,
          tabs: tabs,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}
