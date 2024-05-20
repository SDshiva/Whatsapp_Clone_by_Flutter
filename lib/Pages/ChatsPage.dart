import 'package:chat_app_web_socket_io/Custom%20UI/CustomCard.dart';
import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Screens/ContactsScreen.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage(
      {super.key, required this.chatModels, required this.sourceChat});
  final List<ChatModel> chatModels;
  final ChatModel sourceChat;

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF128C7E),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ContactScreen()));
        },
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: widget.chatModels.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: widget.chatModels[index],
          sourceChat: widget.sourceChat,
        ),
      ),
    );
  }
}
