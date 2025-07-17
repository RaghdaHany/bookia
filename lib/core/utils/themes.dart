import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() => ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
    ),
    fontFamily: AppFonts.dmSerifDisplay,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.Primary,
      onSurface: AppColors.darkColor,
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.accentColor,
      filled: true,
      hintStyle: TextStyles.getSmall(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.borderColor),
  );
}
