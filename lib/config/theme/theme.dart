import 'package:bookly/core/utils/colors/app_color.dart';
import 'package:bookly/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: whiteBackGroundColor,
      textTheme: TextTheme(
        bodyLarge: AppTextStyle.lightTextbodyLarge,
        bodyMedium: AppTextStyle.lightTextbodyMeduim,
        bodySmall: AppTextStyle.lightTextbodySmall,
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: whiteBackGroundColor,
          onPrimary: whiteColor,
          secondary: goldColor,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.green,
          background: Colors.white,
          onBackground: Colors.yellow,
          surface: Colors.orange,
          onSurface:whiteColor),
      appBarTheme:
          const AppBarTheme(elevation: 0.0, color: whiteBackGroundColor),
      iconTheme: const IconThemeData(color:darkGray),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: whiteBackGroundColor));
  static ThemeData darkTheme = ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: darkBackGroundColor,
          onPrimary: whiteColor,
          secondary: goldColor,
          onSecondary: whiteColor,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.black,
          onBackground: Colors.redAccent,
          surface: Colors.transparent,
          onSurface: darkBackGroundColor),
      brightness: Brightness.dark,
      drawerTheme: const DrawerThemeData(
        backgroundColor: darkBackGroundColor,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: darkBackGroundColor,
    
      textTheme: TextTheme(

        bodyLarge: AppTextStyle.darkTextbodyLarge,
        bodyMedium: AppTextStyle.darkTextbodyMeduim,
        bodySmall: AppTextStyle.darkTextbodySmall,
      ),
      appBarTheme:
          const AppBarTheme(elevation: 0.0, color: darkBackGroundColor),
      iconTheme: const IconThemeData(color: lightGray),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: darkBackGroundColor));
}
