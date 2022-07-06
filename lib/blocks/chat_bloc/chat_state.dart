import 'package:equatable/equatable.dart';

import '../../model/chat_model.dart';


abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<User> user;
  const ChatLoaded(this.user);
}

class ChatError extends ChatState {
  final String? message;
  const ChatError(this.message);
}