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
        // textTheme: ,
        textTheme: Theme.of(context).textTheme.apply(
              displayColor: AppColors.darkTextColor,
              bodyColor: AppColors.darkTextColor,
            ),
        appBarTheme: const AppBarTheme(
          color: AppColors.darkBackgroundColor,
        ),dialogTheme: DialogTheme(),
        scaffoldBackgroundColor: AppColors.darkBackgroundColor);
  }
}
