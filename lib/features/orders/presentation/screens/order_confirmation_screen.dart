import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  _buildConfirmationIllustration(),
                  const SizedBox(height: 40),
                  _buildConfirmationText(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
          _buildContinueShoppingButton(context),
        ],
      ),
    );
  }

  Widget _buildConfirmationIllustration() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(AppImages.circle, width: 400, height: 400),
        Positioned(
          child: Image.asset(AppImages.orderConfirmed, width: 250, height: 250),
        ),
      ],
    );
  }

  Widget _buildConfirmationText() {
    return Column(
      children: [
        Text(
          'Order Confirmed!',
          style: AppTextStyle.font28BlackSemiBold.copyWith(fontSize: 32),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'Your order has been confirmed, we will send you confirmation email shortly.',
          style: AppTextStyle.font13DarkGreyRegular.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildContinueShoppingButton(BuildContext context) {
    return MainButton(
      text: 'Continue Shopping',
      onTap: () {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      },
    );
  }
}
