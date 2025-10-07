import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_listview.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 15,
      children: [
        Text(
          'Choose Category',
          style: AppTextStyle.font17WhiteMedium.copyWith(
          color: AppColors.black,
          ),
        ),
        CategoryListView(),
      ],
    );
  }
}
