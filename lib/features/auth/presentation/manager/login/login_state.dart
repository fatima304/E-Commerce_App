import 'package:ecommerce_app/core/network/api_error_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_response_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final LoginResponseModel response;
  const LoginSuccess(this.response);
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);
}
