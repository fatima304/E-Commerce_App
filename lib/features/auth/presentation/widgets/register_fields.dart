import 'dart:developer';
import 'package:ecommerce_app/core/helper/alert_dialog.dart';
import 'package:ecommerce_app/core/helper/validators.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_back_button.dart';
import 'package:ecommerce_app/core/widgets/custom_textfield.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/register/register_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/register/register_state.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      final request = RegisterRequestModel(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      context.read<RegisterCubit>().register(request);

      log(
        '✅ Email: $email, Password: $password, FirstName: $firstName, LastName: $lastName',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          final registerRequest = RegisterRequestModel(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
          );
          Navigator.pop(context);

          Navigator.pushNamed(
            context,
            Routes.verifyOtpScreen,
            arguments: registerRequest,
          );
        } else if (state is RegisterFailure) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          if (state.message.toLowerCase().contains('password must')) {
            setState(() {
              Validators.serverPasswordError = state.message;
            });
            _formKey.currentState!.validate();
          } else {
            showErrorDialog(context, state.message);
          }
        } else if (state is RegisterLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
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
                    SizedBox(height: 50),
                    CustomBackButton(),
                    Center(
                      child: Text(
                        'Sign Up',
                        style: AppTextStyle.font28BlackSemiBold,
                      ),
                    ),
                    SizedBox(height: 150),
                    Text(
                      'First Name',
                      style: AppTextStyle.font13DarkGreyRegular,
                    ),
                    CustomTextfield(
                      controller: _firstNameController,
                      validator: Validators.notEmpty,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Last Name',
                      style: AppTextStyle.font13DarkGreyRegular,
                    ),
                    CustomTextfield(
                      controller: _lastNameController,
                      validator: Validators.notEmpty,
                    ),
                    const SizedBox(height: 20),
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
                  ],
                ),
              ),
            ),
          ),
          MainButton(text: 'Sign Up', onTap: _submitForm),
        ],
      ),
    );
  }
}
