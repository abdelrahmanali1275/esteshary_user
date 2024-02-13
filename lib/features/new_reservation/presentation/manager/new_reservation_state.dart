part of 'new_reservation_cubit.dart';

@immutable
abstract class NewReservationState {}

class NewReservationInitial extends NewReservationState {}

class NewReservationLoading extends NewReservationState {}

class GetTimeLoaded extends NewReservationState {
  final List<Timer> timer;

  GetTimeLoaded({required this.timer});
}

class GetTimeErr extends NewReservationState {
  final String message;

  GetTimeErr({required this.message});
}

class AddRequestLoading extends NewReservationState {}

class AddRequestErr extends NewReservationState {
  final String message;

  AddRequestErr({required this.message});
}

class AddRequestLoaded extends NewReservationState {
  final String message;

  AddRequestLoaded({required this.message});
}
