import 'dart:developer';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  const LoginFields({super.key});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateNotEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      log('✅ Email: $email, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: AppTextStyle.font13DarkGreyRegular),
                  CustomTextfield(
                    controller: _emailController,
                    validator: _validateEmail,
                  ),
                  const SizedBox(height: 20),
                  Text('Password', style: AppTextStyle.font13DarkGreyRegular),
                  CustomTextfield(
                    controller: _passwordController,
                    validator: _validateNotEmpty,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Forgot Password?',
                    style: AppTextStyle.font15RedMedium,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      'By connecting your account confirm that you agree\n                with our',
                  style: AppTextStyle.font13DarkGreyRegular,
                ),
                TextSpan(
                  text: 'Term and Condition',
                  style: AppTextStyle.font13BlackMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        AuthButton(text: 'Login', onTap: _submitForm),
      ],
    );
  }
}
