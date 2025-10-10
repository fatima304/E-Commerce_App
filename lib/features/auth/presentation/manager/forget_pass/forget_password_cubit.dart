import 'dart:developer';
import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_pass/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository) : super(const ForgotPasswordInitial());

  Future<void> forgotPassword(ForgotPasswordRequestModel request) async {
    log('ForgotPasswordCubit: Starting forgot password request for ${request.email}');
    emit(const ForgotPasswordLoading());
    try {
      final response = await _authRepository.forgotPassword(request);
      log('ForgotPasswordCubit: Success response: ${response.message}');
      emit(ForgotPasswordSuccess(response));
    } catch (e) {
      log('ForgotPasswordCubit: Error occurred: $e');
      final errorModel = ApiErrorHandler.handle(e);
      emit(ForgotPasswordFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
