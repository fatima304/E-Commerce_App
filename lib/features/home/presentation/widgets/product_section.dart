import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text(
          'Products',
          style: AppTextStyle.font17WhiteMedium.copyWith(
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 15),
      ]),
    );
  }
}
