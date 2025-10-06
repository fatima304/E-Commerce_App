import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/otp_widget.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 45),
          Align(alignment: Alignment.topLeft, child: customBackButton()),
          Text('Verification Code', style: AppTextStyle.font28BlackSemiBold),
          SizedBox(height: 50),
          Image.asset(AppImages.verify),
          SizedBox(height: 50),
          OtpVerification(),
          Spacer(),
          AuthButton(onTap: () {}, text: 'Confirm Code'),
        ],
      ),
    );
  }
}
