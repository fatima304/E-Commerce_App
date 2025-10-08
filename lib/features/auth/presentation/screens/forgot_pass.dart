import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_pass/forget_password_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: ForgotPasswordForm(),
        ),
      ),
    );
  }
}
