import 'package:ecommerce_app/features/auth/data/models/login/login_request_model.dart';
import 'package:ecommerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginInitial());

 Future<void> login(LoginRequestModel request) async {
  emit(const LoginLoading());
  try {
    final response = await _authRepository.login(request);
    emit(LoginSuccess(response));
  } catch (e) {
    emit(LoginFailure(e.toString()));
  }
}

}
