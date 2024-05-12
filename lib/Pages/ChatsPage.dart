import 'package:chat_app_web_socket_io/Custom%20UI/CustomCard.dart';
import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Screens/ContactsScreen.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<ChatModel> chatModel = [
    ChatModel(
        name: "SD shiva",
        icon: "people.svg",
        isGroup: false,
        time: "16:00",
        currentMessage: "Hey bro, let's meet"),
    ChatModel(
        name: "Football",
        icon: "group.svg",
        isGroup: true,
        time: "00:00",
        currentMessage: "Today is the match day!"),
    ChatModel(
        name: "Sajjad Bro",
        icon: "people.svg",
        isGroup: false,
        time: "02:00",
        currentMessage: "Hey Shibam, when will you come?"),
    ChatModel(
        name: "Family",
        icon: "group.svg",
        isGroup: true,
        time: "06:00",
        currentMessage: "It's time for morning prayer."),
  ];
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
        itemCount: chatModel.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chatModel[index],
        ),
      ),
    );
  }
}
