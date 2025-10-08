import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyle.font22WhiteMedium.copyWith(
            color: AppColors.black,
          ),
        ),
        Text(
          description,
          style: AppTextStyle.font17WhiteMedium.copyWith(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
