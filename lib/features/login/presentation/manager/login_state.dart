part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingGetDataUserState extends LoginState {}
class LookPassChangeState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String message;

  LoginSuccessState(this.message);
}
class LoginErrState extends LoginState {
  final String message;

  LoginErrState(this.message);
}

