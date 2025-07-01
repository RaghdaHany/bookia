import 'package:bookia/components/buttons/main_back_button.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/name_text_form_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: MainBackButton(),
      ),

      bottomNavigationBar: registerButton(context),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you , Again',
                style: TextStyles.getHeadLine1(),
              ),
              Gap(30),

              NameTextFormField(hintText: ' UserName'),

              Gap(15),
              NameTextFormField(hintText: 'Email'),

              Gap(30),

               NameTextFormField(hintText: 'Password'),

              Gap(15),
              NameTextFormField(hintText: 'Confirm Password'),

              Gap(30),
              MainButton(text: 'Register', onPressed: () {}),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea registerButton(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?', style: TextStyles.getBody()),
          Gap(10),
          TextButton(
            onPressed: () {context.pushWithReplacement(Routes.login);},
            child: Text('login', style: TextStyle(color: AppColors.Primary)),
          ),
        ],
      ),
    );
  }
}
