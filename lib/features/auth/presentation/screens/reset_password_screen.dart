import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/helper/validators.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/reset_password/reset_password_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String? otp;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    this.otp,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool _obscureNewPassword = true;

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(
            'Password Reset Successful',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Your password has been reset successfully.\nPlease log in with your new password.',
            style: TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.pushReplacementNamed(
                  context,
                  Routes.loginScreen,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              _showSuccessDialog(context);
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 45),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButton(),
                ),
                Text(
                  'Reset Password',
                  style: AppTextStyle.font28BlackSemiBold,
                ),
                const SizedBox(height: 50),
                Image.asset(AppImages.verify),
                const SizedBox(height: 50),
                // OTP Field
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Verification Code',
                      style: AppTextStyle.font13DarkGreyRegular,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextfield(
                      controller: _otpController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the verification code';
                        }
                        if (value.length != 6) {
                          return 'Verification code must be 6 digits';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // New Password Field
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'New Password',
                      style: AppTextStyle.font13DarkGreyRegular,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomTextfield(
                      controller: _newPasswordController,
                      obscureText: _obscureNewPassword,
                      validator: Validators.password,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                      ),
                    ),
                  ),
                 ),
                const Spacer(),
                Text(
                  'Enter the verification code sent to your email and your new password.',
                  style: AppTextStyle.font13DarkGreyRegular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    return state is ResetPasswordLoading
                        ? const CircularProgressIndicator()
                        : MainButton(
                            text: 'Reset Password',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                               final request = ResetPasswordRequestModel(
                                 email: widget.email,
                                 otp: _otpController.text.trim(),
                                 newPassword: _newPasswordController.text.trim(),
                               );
                                context
                                    .read<ResetPasswordCubit>()
                                    .resetPassword(request);
                                    
                              }
                            },
                          );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
