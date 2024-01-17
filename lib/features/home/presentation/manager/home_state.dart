part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeSpecialistSuccess extends HomeState {
  final List<DoctorModel> doctor;

  HomeSpecialistSuccess(this.doctor);
}
class HomeSpecialistLoading extends HomeState {}
class HomeSpecialistErr extends HomeState {
  final String err;

  HomeSpecialistErr(this.err);
}
