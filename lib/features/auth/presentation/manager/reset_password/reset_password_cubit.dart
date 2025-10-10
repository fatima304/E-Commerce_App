import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/auth/data/models/reset_password/reset_password_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/reset_password/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository _authRepository;

  ResetPasswordCubit(this._authRepository) : super(const ResetPasswordInitial());

  Future<void> resetPassword(ResetPasswordRequestModel request) async {
    emit(const ResetPasswordLoading());
    try {
      final response = await _authRepository.resetPassword(request);
      emit(ResetPasswordSuccess(response.message));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(ResetPasswordFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
