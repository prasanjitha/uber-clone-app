import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../resources/chat_api_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    final ApiChatRepository apiRepository = ApiChatRepository();

    on<GetChatList>((event, emit) async {
      try {
        emit(ChatLoading());
        final mList = await apiRepository.getUsers();
        emit(ChatLoaded(mList));
      } on NetworkError {
        emit(const ChatError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
