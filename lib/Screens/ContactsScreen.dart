import 'package:chat_app_web_socket_io/Custom%20UI/ButtonCard.dart';
import 'package:chat_app_web_socket_io/Custom%20UI/ContactCard.dart';
import 'package:chat_app_web_socket_io/Screens/CreateGroupScreen.dart';
import 'package:flutter/material.dart';

import '../Models/ChatModel.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "267 contacts",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          PopupMenuButton<String>(
            iconSize: 30,
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Invite a friend"),
                  value: "Invite a friend",
                ),
                PopupMenuItem(
                  child: Text("Contacts"),
                  value: "Contacts",
                ),
                PopupMenuItem(
                  child: Text("Refresh"),
                  value: "Refresh",
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  value: "Help",
                ),
              ];
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: chatModel.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => CreateGroupScreen(),
                    ),
                  );
                },
                child: ButtonCard(name: "New Group", icon: Icons.group),
              );
            } else if (index == 1) {
              return InkWell(
                onTap: () {},
                child: ButtonCard(name: "New Contact", icon: Icons.person_add),
              );
            } else {
              return InkWell(
                onTap: () {},
                child: ContactCard(
                  chatModel: chatModel[index],
                ),
              );
            }
          }),
    );
  }
}
