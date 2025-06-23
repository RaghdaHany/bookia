import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppFonts.dmSerifDisplay,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.Primary,
      onSurface: AppColors.darkColor)
  );
}