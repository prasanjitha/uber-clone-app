import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nable/model/chat_model.dart';

import '../blocks/chat_bloc/chat_bloc.dart';
import '../blocks/chat_bloc/chat_event.dart';
import '../blocks/chat_bloc/chat_state.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatBloc _newsBloc = ChatBloc();

  @override
  void initState() {
    _newsBloc.add(GetChatList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is ChatError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is ChatInitial) {
                return _buildLoading();
              } else if (state is ChatLoading) {
                return _buildLoading();
              } else if (state is ChatLoaded) {
                print('---------------------${state.user}');
                return _buildCard(context, state.user);
              } else if (state is ChatError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<User> model) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(8.0),
          child: Card(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Text("Country: ${model[index].email}"),
                 CircleAvatar(
    radius: 10,
    backgroundColor: Colors.white,
    child: CircleAvatar(
      backgroundImage: NetworkImage(model[index].avator),
      radius: 10,
    ),
  )                  // Text(
                  //     "Total Confirmed: ${model.email![index]}"),
                 // Text("Total Deaths: ${model.email![index]}"),
                 // Text(
                   //   "Total Recovered: ${model.phone![index]}"),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}