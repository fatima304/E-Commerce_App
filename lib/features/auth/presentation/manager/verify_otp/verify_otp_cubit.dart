import 'package:ecommerce_app/features/auth/data/models/verify_otp/verify_otp_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'verify_otp_state.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpState> {
  final AuthRepository _authRepository;

  VerifyOtpCubit(this._authRepository) : super(const VerifyOtpInitial());

  Future<void> verifyOtp(VerifyOtpRequestModel request) async {
    emit(const VerifyOtpLoading());
    try {
      final response = await _authRepository.verifyOtp(request);
      emit(VerifyOtpSuccess(response));
    } catch (e) {
      emit(VerifyOtpFailure(e.toString()));
    }
  }
}
