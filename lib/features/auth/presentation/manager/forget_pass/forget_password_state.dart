import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_response_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class ForgotPasswordState {
  const ForgotPasswordState();
}

class ForgotPasswordInitial extends ForgotPasswordState {
  const ForgotPasswordInitial();
}

class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading();
}

class ForgotPasswordSuccess extends ForgotPasswordState {
  final ForgotPasswordResponseModel response;
  const ForgotPasswordSuccess(this.response);
}

class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;
  const ForgotPasswordFailure(this.error);
}
