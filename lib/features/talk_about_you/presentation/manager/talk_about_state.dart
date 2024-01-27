part of 'talk_about_cubit.dart';

@immutable
abstract class TalkAboutState {}

class TalkAboutInitial extends TalkAboutState {}
class RecordChangeState extends TalkAboutState {}
class RecordStartState extends TalkAboutState {}
class StopSuccessState extends TalkAboutState {}
class StopErrState extends TalkAboutState {
  final String message;

  StopErrState(this.message);
}
class RecordStartErrState extends TalkAboutState {
  final String message;

  RecordStartErrState(this.message);
}
class RecordSuccessLoadingState extends TalkAboutState {}
class RecordSuccessState extends TalkAboutState {
  final String message;

  RecordSuccessState(this.message);
}
class RecordSuccessErrState extends TalkAboutState {
  final String err;

  RecordSuccessErrState(this.err);
}

