
import 'package:ecommerce_app/features/auth/data/models/login/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_response_model.dart';
import 'package:ecommerce_app/features/auth/data/network/auth_api_service.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) {
    return _authApiService.login(loginRequest);
  }
}