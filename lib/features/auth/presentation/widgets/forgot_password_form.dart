import 'dart:developer';

import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/helper/validators.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_pass/forget_password_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_pass/forget_password_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            log('Forgot password success: ${state.response.message}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.response.message),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushNamed(
              context,
              Routes.verifyOtpForgotPasswordScreen,
              arguments: _emailController.text.trim(),
            );
          } else if (state is ForgotPasswordFailure) {
            log('Forgot password failure: ${state.error}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Conection Error'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 45),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: CustomBackButton(),
                  ),
                  Text('Forgot Password', style: AppTextStyle.font28BlackSemiBold),
                  const SizedBox(height: 50),
                  Image.asset(AppImages.verify),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Email',
                      style: AppTextStyle.font13DarkGreyRegular,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextfield(
                    controller: _emailController,
                    validator: Validators.email,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Please write your email to receive a \nconfirmation code to set a new password.',
                    style: AppTextStyle.font13DarkGreyRegular,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  state is ForgotPasswordLoading
                      ? const CircularProgressIndicator()
                      : MainButton(
                          text: 'Confirm Mail',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<ForgotPasswordCubit>().forgotPassword(
                                ForgotPasswordRequestModel(
                                  email: _emailController.text.trim(),
                                ),
                              );
                            }
                          },
                        ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
