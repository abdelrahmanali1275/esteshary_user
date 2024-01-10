part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingGetDataUserState extends LoginState {}
class LoginGetDataUserState extends LoginState {}

