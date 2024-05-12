import 'package:chat_app_web_socket_io/Custom%20UI/ContactCard.dart';
import 'package:flutter/material.dart';

import '../Models/ChatModel.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  List<ChatModel> chatModel = [
    ChatModel(
      name: "SD shiva",
      icon: "people.svg",
      status: "Available",
    ),
    ChatModel(
      name: "Elias Hossain",
      icon: "people.svg",
      status: "Available",
    ),
    ChatModel(
      name: "Shibam Dey",
      icon: "people.svg",
      status: "Busy",
    ),
    ChatModel(
      name: "XYZ",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "ABC",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "DEF",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "GHI",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "JKL",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "MNO",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "PQR",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "STW",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "APPLE",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "SAMSUNG",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "NOKIA",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
    ChatModel(
      name: "REDMI",
      icon: "people.svg",
      status: "No call, msg only!",
    ),
  ];

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(
            bottom: 3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Add participants",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: chatModel.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (!chatModel[index].select) {
                  setState(() {
                    chatModel[index].select = true;
                    groups.add(chatModel[index]);
                    print(groups.length);
                  });
                } else {
                  setState(() {
                    chatModel[index].select = false;
                    groups.remove(chatModel[index]);
                    print(groups);
                  });
                }
              },
              child: ContactCard(
                chatModel: chatModel[index],
              ),
            );
          }),
    );
  }
}
