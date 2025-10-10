import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_state.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/reset_password/reset_password_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/reset_password/reset_password_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/otp_widget.dart';

enum OtpMode { registration, passwordReset }

class VerifyOtpScreen extends StatefulWidget {
  final OtpMode mode;
  final RegisterRequestModel? userModel;
  final String? email;

  const VerifyOtpScreen({
    super.key,
    this.userModel,
    this.email,
    this.mode = OtpMode.registration,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String? _otpCode;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscureNewPassword = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    final isRegistration = widget.mode == OtpMode.registration;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            isRegistration
                ? 'Registration Successful'
                : 'Password Reset Successful',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            isRegistration
                ? 'Your account has been verified successfully.\nPlease log in to continue.'
                : 'Your password has been reset successfully.\nPlease log in with your new password.',
            style: const TextStyle(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
                Navigator.pushReplacementNamed(context, Routes.loginScreen);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = widget.mode == OtpMode.registration
        ? widget.userModel!.email
        : widget.email!;
    final isRegistration = widget.mode == OtpMode.registration;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: getIt<VerifyOtpCubit>()),
          BlocProvider.value(value: getIt<ResetPasswordCubit>()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<VerifyOtpCubit, VerifyOtpState>(
              listener: (context, state) {
                if (state is VerifyOtpSuccess && isRegistration) {
                  _showSuccessDialog(context);
                } else if (state is VerifyOtpFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
            ),
            BlocListener<ResetPasswordCubit, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordSuccess && !isRegistration) {
                  _showSuccessDialog(context);
                } else if (state is ResetPasswordFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 45),
              const Align(
                alignment: Alignment.topLeft,
                child: CustomBackButton(),
              ),
              Text(
                isRegistration ? 'Verification Code' : 'Reset Password',
                style: AppTextStyle.font28BlackSemiBold,
              ),
              const SizedBox(height: 50),
              Image.asset(AppImages.verify),
              const SizedBox(height: 50),
              Text(
                isRegistration
                    ? 'Enter the verification code sent to your email'
                    : 'Enter the verification code and your new password',
                style: AppTextStyle.font13DarkGreyRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              OtpVerification(
                onCompleted: (code) {
                  _otpCode = code;
                },
              ),
              if (!isRegistration) ...[
                const SizedBox(height: 20),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your new password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
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
                // Confirm Password Field
              ],
              const Spacer(),
              _buildSubmitButton(isRegistration, email),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(bool isRegistration, String email) {
    if (isRegistration) {
      return BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
        builder: (context, state) {
          return state is VerifyOtpLoading
              ? const CircularProgressIndicator()
              : MainButton(
                  text: 'Confirm Code',
                  onTap: () {
                    if (_otpCode != null && _otpCode!.length == 6) {
                      final request = VerifyOtpRequestModel(
                        email: email,
                        otp: _otpCode!,
                      );
                      context.read<VerifyOtpCubit>().verifyOtp(request);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter OTP code')),
                      );
                    }
                  },
                );
        },
      );
    } else {
      return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          return state is ResetPasswordLoading
              ? const CircularProgressIndicator()
              : MainButton(
                  text: 'Reset Password',
                  onTap: () {
                    if (_otpCode != null && _otpCode!.length == 6) {
                      final request = ResetPasswordRequestModel(
                        email: email,
                        otp: _otpCode!,
                        newPassword: _newPasswordController.text.trim(),
                      );
                      context.read<ResetPasswordCubit>().resetPassword(request);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please enter complete OTP and password',
                          ),
                        ),
                      );
                    }
                  },
                );
        },
      );
    }
  }
}
