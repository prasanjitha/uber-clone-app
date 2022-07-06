

import 'package:nable/model/chat_model.dart';

import 'chat_api_provider.dart';

class ApiChatRepository {
  final _provider = ApiChatProvider();

  Future<List<User>> getUsers() {
    return _provider.getUsers();
  }
}

class NetworkError extends Error {}