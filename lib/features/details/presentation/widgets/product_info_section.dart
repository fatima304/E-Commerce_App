import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productCode,
    required this.color,
  });

  final String productCode;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Code: $productCode',
          style: AppTextStyle.font17WhiteMedium.copyWith(
            color: AppColors.black,
          ),
        ),
        Text(
          'Product Color: $color',
          style: AppTextStyle.font17WhiteMedium.copyWith(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
