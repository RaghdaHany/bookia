import 'package:flutter/material.dart';

class NameTextFormField extends StatelessWidget {
  const NameTextFormField({
    super.key, this.hintText, this.controller, this.validator, this.keyboardType, this.suffixIcon,
  });

  final String? hintText;
    final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event){
      FocusManager.instance.primaryFocus?.unfocus();
    },

    validator: validator,
    
    keyboardType: keyboardType,
    decoration: InputDecoration(hintText: hintText,
     suffixIcon: suffixIcon,
    suffixIconConstraints: BoxConstraints(maxWidth: 50)),
        );
  }
}
