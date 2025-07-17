import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,

    this.height,
    this.width,
    required this.text,
    required this.onPressed,
    this.bgColor,
    this.textColor,
    this.borderColor,
  });

  final double? height;
  final double? width;
  final String text;
  final Function() onPressed;
  final Color? bgColor;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? AppColors.Primary,
          side:
              borderColor != null
                  ? BorderSide(color: borderColor ?? AppColors.darkColor)
                  : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: TextStyles.getBody(color: textColor)),
      ),
    );
  }
}
