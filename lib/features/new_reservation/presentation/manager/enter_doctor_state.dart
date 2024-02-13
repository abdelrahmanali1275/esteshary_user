part of 'enter_doctor_cubit.dart';

@immutable
abstract class EnterDoctorState {}

class EnterDoctorInitial extends EnterDoctorState {}
class AllDoctorSuccess extends EnterDoctorState {
  final List<DoctorModel> data;

  AllDoctorSuccess(this.data);
}
class AllDoctorLoading extends EnterDoctorState {}
class AllDoctorErr extends EnterDoctorState {
  final String err;

  AllDoctorErr(this.err);
}
