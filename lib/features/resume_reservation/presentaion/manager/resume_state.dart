part of 'resume_cubit.dart';

@immutable
abstract class ResumeState {}

class ResumeInitial extends ResumeState {}
class AcceptRequestsLoading extends ResumeState {}
class AcceptRequestsErr extends ResumeState {
  final String message;

  AcceptRequestsErr({required this.message});
}
class AcceptRequestsLoaded extends ResumeState {
  final List<RequestModel> data;

  AcceptRequestsLoaded({required this.data});
}