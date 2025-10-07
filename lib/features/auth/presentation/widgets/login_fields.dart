import 'dart:developer';
import 'package:ecommerce_app/core/helper/validators.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login/login_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/core/helper/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final request = LoginRequestModel(email: email, password: password);
      context.read<LoginCubit>().login(request);
      log('✅ Email: $email, Password: $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.homeScreen);
        } else if (state is LoginFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          if (state.error.toLowerCase().contains('password must')) {
            setState(() {
              Validators.serverPasswordError = state.error;
            });
            _formKey.currentState!.validate();
          } else {
            showErrorDialog(context, state.error);
          }
        }
      },
      child: Column(
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
                      validator: Validators.email,
                    ),
                    const SizedBox(height: 20),
                    Text('Password', style: AppTextStyle.font13DarkGreyRegular),
                    CustomTextfield(
                      controller: _passwordController,
                      validator: Validators.password,
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
      ),
    );
  }
}
