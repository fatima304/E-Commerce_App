import 'dart:developer';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_response_model.dart';
import 'package:ecommerce_app/features/auth/data/network/auth_api_service.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login(LoginRequestModel loginRequest);
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest);
  Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel otpRequest);
  Future<ForgotPasswordResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  );
  Future<ResetPasswordResponseModel> resetPassword(
    ResetPasswordRequestModel request,
  );
  Future<void> logout(); 

}

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService _authApiService;

  AuthRepositoryImpl(this._authApiService);

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) {
    return _authApiService.login(loginRequest);
  }

  @override
  Future<RegisterResponseModel> register(RegisterRequestModel registerRequest) {
    return _authApiService.register(registerRequest);
  }

 @override
Future<VerifyOtpResponseModel> verifyOtp(VerifyOtpRequestModel otpRequest) async {
  final response = await _authApiService.verifyOtpRaw(otpRequest);

  if (response is String) {
     return VerifyOtpResponseModel(
      statusCode: 200,
      message: response,
      errors: null,
    );
  } else if (response is Map<String, dynamic>) {
    return VerifyOtpResponseModel.fromJson(response);
  } else {
    throw Exception('Unexpected response format');
  }
}


    @override
  Future<ForgotPasswordResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    log('AuthRepository: Calling forgotPassword API for ${request.email}');
    final response = await _authApiService.forgotPassword(request);
    log('AuthRepository: Received response type: ${response.runtimeType}');
    log('AuthRepository: Received response: $response');
    
    if (response is String) {
      log('AuthRepository: Processing string response');
      return ForgotPasswordResponseModel(message: response);
    } else if (response is Map<String, dynamic>) {
      log('AuthRepository: Processing map response');
      final message = response['message'] as String? ?? 'OTP sent successfully';
      return ForgotPasswordResponseModel(message: message);
    } else {
      log('AuthRepository: Unexpected response format: ${response.runtimeType}');
      throw Exception('Unexpected response format: ${response.runtimeType}');
    }
  }

  @override
  Future<ResetPasswordResponseModel> resetPassword(
    ResetPasswordRequestModel request,
  ) async {
    final response = await _authApiService.resetPassword(request);
    
    if (response is String) {
      return ResetPasswordResponseModel(
        statusCode: 200,
        message: response,
        errors: null,
      );
    } else if (response is Map<String, dynamic>) {
      return ResetPasswordResponseModel.fromJson(response);
    } else {
      throw Exception('Unexpected response format');
    }
  }

  @override
Future<void> logout() {
  return _authApiService.logout();
}
}
