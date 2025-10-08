import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String? hintText;

  const CustomTextfield({
    super.key,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder:  InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
