import 'package:flutter/material.dart';

typedef fieldValidation = String? Function(String?)?;
class CustomFormField extends StatelessWidget {
  String lable;
  TextInputType keyboard;
  bool obscureText;
  Widget? suffixIcon;
  fieldValidation validator;
  TextEditingController controller;

  CustomFormField({Key? key,required this.controller,this.validator,this.suffixIcon,this.obscureText = false, required this.lable,required this.keyboard}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboard,
      obscureText: obscureText,
      obscuringCharacter: "*",
      controller: controller,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16
      ),
      decoration: InputDecoration(
        labelText: lable,
        suffixIcon: suffixIcon,

      ),
    );
  }
}
