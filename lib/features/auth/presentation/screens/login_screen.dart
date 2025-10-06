import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/login_fields.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45),
          customBackButton(),
          Center(
            child: Text('Welcome', style: AppTextStyle.font28BlackSemiBold),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              'Please enter your data to continue',
              style: AppTextStyle.font13DarkGreyRegular,
            ),
          ),
          SizedBox(height: 150),
          Expanded(child: LoginFields()),
        ],
      ),
    );
  }
}
