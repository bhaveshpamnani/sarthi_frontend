import 'package:flutter/material.dart';
import 'package:newsarthi/utils/theme/text_field_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_theme.dart';
class SAppTheme{
  SAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    //fontfamily:
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevetedButton.lightElevatedButtonTheme,
    chipTheme: SChipTheme.lightChipTheme,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      //fontfamily:
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: STextTheme.darkTextTheme,
      elevatedButtonTheme: SElevetedButton.darkElevatedButtonTheme,
      chipTheme: SChipTheme.darkChipTheme,
      appBarTheme: SAppBarTheme.darkAppBarTheme,
      checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
      bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: STextFormFieldTheme.darkInputDecorationTheme
  );
}