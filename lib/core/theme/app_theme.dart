import 'package:flutter/material.dart';
import 'package:note/core/styles/color_constants.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.primary,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            displayColor: AppColors.darkTextColor,
            bodyColor: AppColors.darkTextColor,
          ),
      appBarTheme: const AppBarTheme(
        color: AppColors.darkBackgroundColor,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: AppColors.darkBackGroundIconButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    );
  }
}
