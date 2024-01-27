part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatSuccess extends ChatState {}
class ChatImageSuccess extends ChatState {}
class ChatImageLoading extends ChatState {}
class FileImageLoading extends ChatState {}


