import 'package:bookia/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyle getHeadLine1({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight
  }){
    return TextStyle(
      fontSize: fontSize ?? 30,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

  static TextStyle getHeadLine2({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight
  }){
    return TextStyle(
      fontSize: fontSize ?? 24,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

    static TextStyle getTitle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight
  }){
    return TextStyle(
      fontSize: fontSize ?? 18,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

    static TextStyle getBody({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight
  }){
    return TextStyle(
      fontSize: fontSize ?? 16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.darkColor,
    );
  }

    static TextStyle getSmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight
  }){
    return TextStyle(
      fontSize: fontSize ?? 30,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.greyColor,
    );
  }
}
