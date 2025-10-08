import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.onTap, required this.text});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(color: AppColors.mainColor),
        child: Center(child: Text(text, style: AppTextStyle.font17WhiteMedium)),
      ),
    );
  }
}
