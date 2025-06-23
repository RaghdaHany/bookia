import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/extensions/media_query.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.welcomeBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  Gap(context.height * 0.15),
                  SvgPicture.asset(AppAssets.logoSvg, width: context.width* 0.55),
                  Gap(10),
                  Text('Order Your Book Now!', style: TextStyles.getTitle()),
                  Spacer(),

                  MainButton(text: 'Login', onPressed: () {}),

                  Gap(15),
                  MainButton(
                    text: 'Register',
                    bgColor: AppColors.whiteColor,
                    textColor: AppColors.darkColor,
                    borderColor: AppColors.darkColor,
                    onPressed: () {},
                  ),
                  Gap(context.height * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
