import 'package:ecommerce_app/features/auth/data/models/register/register_response_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterState {
  final RegisterResponseModel response;
  const RegisterSuccess(this.response);
}

class RegisterFailure extends RegisterState {
  final String message;
  const RegisterFailure(this.message);
}
