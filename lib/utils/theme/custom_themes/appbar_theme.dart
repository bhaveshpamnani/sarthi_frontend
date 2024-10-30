import 'package:flutter/material.dart';
class SAppBarTheme{
  SAppBarTheme._();
  static final lightAppBarTheme = AppBarTheme(
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black,size: 24),
        actionsIconTheme: const IconThemeData(color: Colors.black,size: 24),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black,size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white,size: 24),
    titleTextStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.white),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}