import 'dart:developer';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class RegisterFields extends StatefulWidget {
  const RegisterFields({super.key});

  @override
  State<RegisterFields> createState() => _RegisterFieldsState();
}

class _RegisterFieldsState extends State<RegisterFields> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      Navigator.pushNamed(context, Routes.loginScreen);
      log(
        '✅ First: $firstName, Last: $lastName, Email: $email, Password: $password',
      );
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
                  Text('First Name', style: AppTextStyle.font13DarkGreyRegular),
                  CustomTextfield(
                    controller: _firstNameController,
                    validator: _validateNotEmpty,
                  ),
                  const SizedBox(height: 20),
                  Text('Last Name', style: AppTextStyle.font13DarkGreyRegular),
                  CustomTextfield(
                    controller: _lastNameController,
                    validator: _validateNotEmpty,
                  ),
                  const SizedBox(height: 20),
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
                ],
              ),
            ),
          ),
        ),
        AuthButton(text: 'Sign Up', onTap: _submitForm),
      ],
    );
  }
}
