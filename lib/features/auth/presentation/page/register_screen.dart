
import 'dart:developer';

import 'package:bookia/components/buttons/main_back_button.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/dialogs/loading_dialog.dart';
import 'package:bookia/components/inputs/name_text_form_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/extensions/navigation.dart';
import 'package:bookia/core/extensions/validations.dart';
import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit,AuthState>(
        listener: (context, state) { 
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
        builder:(context , state) {
          var cubit = context.read<AuthCubit>();
          return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: false, title: MainBackButton()),
        
          bottomNavigationBar: registerButton(context),
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
                        
                    NameTextFormField(controller: cubit.nameController,
                     hintText: ' UserName',
                     validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Name' ;
                      }
                      return null;
                     } ,),
                
                        
                    Gap(15),
                    NameTextFormField(controller: cubit.emailController,
                     hintText: 'Email',
                     validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Email' ;
                      }else if(!isEmailValid(value)){
                        return 'Please Enter Valid Email';

                      }
                      return null;
                     } ,),
                        
                    Gap(30),
                        
                    NameTextFormField(controller: cubit.passwordController,
                    hintText: 'Password',
                            validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Password' ;
                      }
                      return null;
                     } ,),
                
                    Gap(15),
                    NameTextFormField(controller: cubit.passwordConfirmationController,
                    hintText: 'Confirm Password',
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please Enter Password Confirmation' ;
                      }
                      return null;
                     } ,),
                        
                    Gap(30),
                    MainButton(text: 'Register', 
                    onPressed: () {
                      if(cubit.formKey.currentState!.validate()) {
                        cubit.register();
                      }
                      }),
                    Gap(20),
                  ],
                ),
              ),
            ),
          ),
        );
        },
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
            onPressed: () {
              context.pushWithReplacement(Routes.login);
            },
            child: Text('login', style: TextStyle(color: AppColors.Primary)),
          ),
        ],
      ),
    );
  }
}
