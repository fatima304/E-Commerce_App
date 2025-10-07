import 'package:ecommerce_app/core/network/api_error_handler.dart';
import 'package:ecommerce_app/features/auth/data/models/register/register_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(const RegisterInitial());

  Future<void> register(RegisterRequestModel request) async {
    emit(const RegisterLoading());
    try {
      final response = await _authRepository.register(request);
      emit(RegisterSuccess(response));
    } catch (e) {
      final errorModel = ApiErrorHandler.handle(e);
      emit(RegisterFailure(errorModel.message ?? "Unknown error"));
    }
  }
}
