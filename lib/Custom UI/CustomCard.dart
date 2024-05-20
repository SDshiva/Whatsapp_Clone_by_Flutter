// ignore: file_names
import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Screens/IndividualChatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualChatScreen(
              chatModel: chatModel,
              sourceChat: sourceChat,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                "assets/${chatModel.icon!}",
                color: Colors.white,
                width: 40,
                height: 40,
              ),
            ),
            title: Text(
              chatModel.name!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all_rounded),
                const SizedBox(
                  width: 3,
                ),
                Text(chatModel.currentMessage!),
              ],
            ),
            trailing: Text(chatModel.time!),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 85, right: 20),
            child: Divider(
              thickness: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
