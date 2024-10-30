import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SSearchContainer extends StatelessWidget {
  const SSearchContainer({
    super.key,
    this.shoeBackground = true,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBorder = false,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
  });

  final bool shoeBackground, showBorder;
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFuctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          height: 50,
          width: SDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(SSizes.xs),
          decoration: BoxDecoration(
            color: shoeBackground
                ? dark
                    ? SColors.dark
                    : SColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: SColors.grey) : null,
          ),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder:  const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: text,
              prefixIcon: const Icon(CupertinoIcons.search)
            ),

          )
        ),
      ),
    );
  }
}
