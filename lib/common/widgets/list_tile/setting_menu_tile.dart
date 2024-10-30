import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SSettingMenuTile extends StatelessWidget {
  const SSettingMenuTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icon,
      this.trailing,
      this.onTap});

  final String title, subTitle;
  final IconData icon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: SColors.primaryColor,
        size: 28,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
