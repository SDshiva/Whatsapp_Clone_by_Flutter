import 'package:chat_app_web_socket_io/Custom%20UI/ButtonCard.dart';
import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
      name: "SD shiva",
      icon: "people.svg",
      isGroup: false,
      time: "16:00",
      currentMessage: "Hey bro, let's meet",
      id: 1,
    ),
    ChatModel(
      name: "Sajjad Bro",
      icon: "people.svg",
      isGroup: false,
      time: "02:00",
      currentMessage: "Hey Shibam, when will you come?",
      id: 2,
    ),
    // ChatModel(
    //   name: "Football",
    //   icon: "group.svg",
    //   isGroup: true,
    //   time: "00:00",
    //   currentMessage: "Today is the match day!",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            sourceChat = chatModels.removeAt(index);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(
                  chatModels: chatModels,
                  soureChat: sourceChat!,
                ),
              ),
            );
          },
          child: ButtonCard(
            name: chatModels[index].name!,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
