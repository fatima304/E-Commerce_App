import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/helper/app_images.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/verify_otp/verify_otp_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/otp_widget.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.userModel});
  final RegisterRequestModel userModel;

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String? _otpCode;

  @override
  Widget build(BuildContext context) {
    final email = widget.userModel.email;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is VerifyOtpSuccess) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else if (state is VerifyOtpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 45),
            Align(alignment: Alignment.topLeft, child: CustomBackButton()),
            Text('Verification Code', style: AppTextStyle.font28BlackSemiBold),
            const SizedBox(height: 50),
            Image.asset(AppImages.verify),
            const SizedBox(height: 50),
            OtpVerification(
              onCompleted: (code) {
                _otpCode = code;
              },
            ),
            const Spacer(),
            AuthButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
