import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  "assets/${chatModel.icon!}",
                  height: 30,
                  width: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  radius: 10,
                  child: Icon(
                    Icons.clear,
                    size: 12,
                  ),
                ),
              )
            ],
          ),
          Text(
            chatModel.name!,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
