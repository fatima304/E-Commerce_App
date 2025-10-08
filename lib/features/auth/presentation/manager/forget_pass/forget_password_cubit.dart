import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/auth/data/models/forget_pass/forgot_password_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/forget_pass/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository) : super(const ForgotPasswordInitial());

  Future<void> forgotPassword(ForgotPasswordRequestModel request) async {
    emit(const ForgotPasswordLoading());
    try {
      final response = await _authRepository.forgotPassword(request);
      emit(ForgotPasswordSuccess(response));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(ForgotPasswordFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
