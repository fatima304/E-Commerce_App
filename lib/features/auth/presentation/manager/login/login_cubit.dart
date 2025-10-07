import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/core/network/dio_factory.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/auth/data/models/login/login_request_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginInitial());

  Future<void> login(LoginRequestModel request) async {
    emit(const LoginLoading());
    try {
      final response = await _authRepository.login(request);
      await DioFactory.saveTokens(
        response.accessToken,
        response.refreshToken ?? '',
      );
      emit(LoginSuccess(response));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(LoginFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
