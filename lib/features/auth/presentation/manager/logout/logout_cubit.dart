import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepository _authRepository;

  LogoutCubit(this._authRepository) : super(const LogoutInitial());

  Future<void> logout() async {
    log("Logout Cubit Called ✅"); // ⬅️ أضيفي دي مؤقتًا
    emit(const LogoutLoading());
    try {
      await _authRepository.logout();
      await DioFactory.clearTokens();
      emit(const LogoutSuccess());
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(LogoutFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
