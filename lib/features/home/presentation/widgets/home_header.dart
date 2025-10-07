import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SizedBox(height: 100),
        Text('Hello', style: AppTextStyle.font28BlackSemiBold),
        Text(
          'Welcome to Laza.',
          style: AppTextStyle.font13DarkGreyRegular.copyWith(fontSize: 15),
        ),
        SizedBox(height: 20),
        SearchTextField(),
      ],
    );
  }
}
