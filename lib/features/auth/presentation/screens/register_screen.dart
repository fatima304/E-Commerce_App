import 'package:ecommerce_app/core/di/dependency_injection.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/register_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: RegisterFields()),
          ],
        ),
      ),
    );
  }
}
