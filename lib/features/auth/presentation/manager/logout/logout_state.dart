import 'package:meta/meta.dart';

@sealed
abstract class LogoutState {
  const LogoutState();
}

class LogoutInitial extends LogoutState {
  const LogoutInitial();
}

class LogoutLoading extends LogoutState {
  const LogoutLoading();
}

class LogoutSuccess extends LogoutState {
  const LogoutSuccess();
}

class LogoutFailure extends LogoutState {
  final String error;
  const LogoutFailure(this.error);
}
