import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_response_model.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/network/api_constants.dart';
import '../models/login/login_request_model.dart';
import '../models/login/login_response_model.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(ApiConstants.loginUrl) 
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);

  @POST(ApiConstants.registerUrl) 
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel body);

@POST(ApiConstants.verifyEmailUrl)
Future<dynamic> verifyOtpRaw(@Body() VerifyOtpRequestModel body);


@POST(ApiConstants.forgetPassUrl)
  Future<dynamic> forgotPassword(
    @Body() ForgotPasswordRequestModel body,
  );

@POST(ApiConstants.resetPasswordUrl)
Future<dynamic> resetPassword(@Body() ResetPasswordRequestModel body);

@POST(ApiConstants.logoutUrl)
Future<void> logout();

}
