import 'package:ecommerce_app/core/helper/app_icon.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

Padding customBackButton() {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: CircleAvatar(
      radius: 22.5,
      backgroundColor: AppColors.lightGrey,
      child: Image.asset(AppICons.arrowLeft),
    ),
  );
}
