import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_response_model.dart';
import 'package:meta/meta.dart';

@sealed
abstract class VerifyOtpState {
  const VerifyOtpState();
}

class VerifyOtpInitial extends VerifyOtpState {
  const VerifyOtpInitial();
}

class VerifyOtpLoading extends VerifyOtpState {
  const VerifyOtpLoading();
}

class VerifyOtpSuccess extends VerifyOtpState {
  final VerifyOtpResponseModel response;
  const VerifyOtpSuccess(this.response);
}

class VerifyOtpFailure extends VerifyOtpState {
  final String message;
  const VerifyOtpFailure(this.message);
}
