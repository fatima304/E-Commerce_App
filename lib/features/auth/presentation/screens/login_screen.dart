import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/login/login_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/login_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            CustomBackButton(),
            Center(
              child: Text('Welcome', style: AppTextStyle.font28BlackSemiBold),
            ),
            SizedBox(height: 5),
            Center(
              child: Text(
                'Please enter your data to continue',
                style: AppTextStyle.font13DarkGreyRegular,
              ),
            ),
            SizedBox(height: 150),
            Expanded(child: LoginFields()),
          ],
        ),
      ),
    );
  }
}
