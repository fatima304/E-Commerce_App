import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/register_fields.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 45),
          customBackButton(),
          Center(
            child: Text('Sign Up', style: AppTextStyle.font28BlackSemiBold),
          ),
          SizedBox(height: 150),
          Expanded(child: RegisterFields()),
        ],
      ),
    );
  }
}
