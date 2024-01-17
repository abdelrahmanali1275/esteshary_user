part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoadingGetDataUserState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final String message;

  RegisterSuccessState(this.message);
}
class RegisterErrState extends RegisterState {
  final String message;

  RegisterErrState(this.message);
}
