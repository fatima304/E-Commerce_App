import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class CouponInputField extends StatelessWidget {
  final TextEditingController controller;

  const CouponInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      controller: controller,
      hintText: 'Enter coupon code (e.g., SAVE50, DISCOUNT30)',
    );
  }
}
