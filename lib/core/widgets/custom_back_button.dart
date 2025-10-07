import 'package:ecommerce_app/core/helper/app_icon.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleAvatar(
          radius: 22.5,
          backgroundColor: AppColors.lightGrey,
          child: Image.asset(AppICons.arrowLeft),
        ),
      ),
    );
  }
}
