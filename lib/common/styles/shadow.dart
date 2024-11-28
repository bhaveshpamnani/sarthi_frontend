import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
class SShadowStyle{
  static final verticalProductShadow = BoxShadow(
    color: SColors.darkerGrey.withOpacity(0.2),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}