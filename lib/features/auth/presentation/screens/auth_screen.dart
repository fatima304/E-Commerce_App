import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/social_fields.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45),
          CustomBackButton(),
          Center(
            child: Text(
              'Let\'s Get Started',
              style: AppTextStyle.font28BlackSemiBold,
            ),
          ),
          SizedBox(height: 200),
          Expanded(child: AuthFields()),
        ],
      ),
    );
  }
}
