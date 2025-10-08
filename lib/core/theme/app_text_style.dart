import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/font_family_helper.dart';
import 'package:ecommerce_app/core/theme/font_weight_helper.dart';

class AppTextStyle {
  static TextStyle font22WhiteMedium = TextStyle(
    fontSize: 22,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font17WhiteMedium = TextStyle(
    fontSize: 17,
    color: AppColors.white,
    fontWeight: FontWeightHelper.medium,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font17BlackSemiBold = TextStyle(
    fontSize: 17,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font15BlackMedium = TextStyle(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font15RedMedium = TextStyle(
    fontSize: 15,
    color: AppColors.red,
    fontWeight: FontWeightHelper.regular,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font28BlackSemiBold = TextStyle(
    fontSize: 28,
    color: AppColors.black,
    fontWeight: FontWeightHelper.semiBold,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font13DarkGreyRegular = TextStyle(
    fontSize: 13,
    color: AppColors.darkGrey,
    fontWeight: FontWeightHelper.regular,
    fontFamily: FontFamilyHelper.interFont,
  );
  static TextStyle font13BlackMedium = TextStyle(
    fontSize: 13,
    color: AppColors.black,
    fontWeight: FontWeightHelper.medium,
    fontFamily: FontFamilyHelper.interFont,
  );
}
