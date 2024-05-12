import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 63,
          child: Stack(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                  "assets/${chatModel.icon!}",
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ),
              ),
              chatModel.select
                  ? Positioned(
                      bottom: 2,
                      right: 4,
                      child: CircleAvatar(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        radius: 10,
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chatModel.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              chatModel.status!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
