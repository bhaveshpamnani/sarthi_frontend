import 'package:flutter/material.dart';

class SAppTheme {
  SAppTheme._();

  // Define light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: SAppBarTheme.lightAppBarTheme, // Use the custom light AppBar theme
    primaryColor: Colors.blue,
    // Other theme properties...
  );

  // Define dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: SAppBarTheme.darkAppBarTheme, // Use the custom dark AppBar theme
    primaryColor: Colors.blueGrey,
    // Other theme properties...
  );
}

class SAppBarTheme {
  SAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.black, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    actionsIconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.white,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}
