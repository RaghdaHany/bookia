import 'dart:developer';

import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/components/inputs/name_text_form_field.dart';
import 'package:bookia/core/constants/app_assets.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/social_login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit() ,
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state){
           if(state is AuthSuccessState){
            context.pop();
            log('success');

          }else if(state is AuthErrorState){
            context.pop();
            showErrorDialog(context, 'Something Went Wrong');
          }else if(state is AuthLoadingState){
            showLoadingDialog(context);
            
          }
        },
        builder: (context,state){
          var cubit = context.read<AuthCubit>();
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(children: [SvgPicture.asset(AppAssets.backSvg)]),
          ),
        
          bottomNavigationBar: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?', style: TextStyles.getBody()),
                Gap(10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Register Now',
                    style: TextStyle(color: AppColors.Primary),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Text(
                      'Welcome back! Glad to see you , Again',
                      style: TextStyles.getHeadLine1(),
                    ),
                    Gap(30),
                        
                    NameTextFormField(controller: cubit.emailController,
                    hintText: 'Enter Your Email',
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Your Email' ;
                      }
                      return null;
                     } ,),
                        
                    Gap(15),
                    NameTextFormField(
                      controller: cubit.passwordController,
                      hintText: 'Enter Your Password',
                      
                      suffixIcon: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(AppAssets.eyeSvg),
                        ),
                      ),
                      validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Password Confirmation' ;
                      }
                      return null;
                     } ,
                    ),
                        
                    Gap(30),
                    MainButton(text: 'Login', onPressed: () {
                      if(cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    }),
                    Gap(30),
                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Gap(10),
                        Text(
                          'Or Login With',
                          style: TextStyles.getBody(color: AppColors.greyColor),
                        ),
                        Gap(10),
                        Expanded(child: Divider()),
                      ],
                    ),
                    Gap(20),
                    SocialLoginWidget(),
                  ],
                ),
              ),
            ),
          ),
              );},
      ),
    );
  }
}
