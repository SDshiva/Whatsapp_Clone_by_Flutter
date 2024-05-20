import 'package:chat_app_web_socket_io/Custom%20UI/OwnMessageCard.dart';
import 'package:chat_app_web_socket_io/Custom%20UI/ReplyMessageCard.dart';
import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Models/MessageModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualChatScreen extends StatefulWidget {
  const IndividualChatScreen(
      {super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  IO.Socket? socket;
  bool sendButton = false;
  List<MessageModel> messages = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.68.26:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    socket!.onConnect((data) {
      print("Socket Connected!");
      socket!.emit("signIn", widget.sourceChat.id);
      socket!.on("data", (data) {
        setMessage("destination", data["message"]);
        print(data);
      });
    });

    print(socket!.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket!.emit(
      "data",
      {"message": message, "sourceId": sourceId, "targetId": targetId},
    );
    setState(() {
      textEditingController.clear();
    });
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    setState(() {
      messages.add(messageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsappBackground.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 80,
            titleSpacing: 0,
            leading: Container(
              padding: const EdgeInsets.only(right: 4, left: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      "assets/${widget.chatModel.icon}",
                      color: Colors.white,
                      width: 35,
                      height: 35,
                    ),
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            title: Container(
              width: 400,
              margin: EdgeInsets.only(right: 5, left: 5),
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Title(
                      color: Colors.white,
                      child: Text(widget.chatModel.name!),
                    ),
                    Text(
                      "Last seen today at 14:00",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: "View contact",
                    child: Text("View contact"),
                  ),
                  PopupMenuItem(
                    value: "Media, links, and docs",
                    child: Text("Media, links, and docs"),
                  ),
                  PopupMenuItem(
                    value: "Search",
                    child: Text("Search"),
                  ),
                  PopupMenuItem(
                    value: "Mute notification",
                    child: Text("Mute notification"),
                  ),
                  PopupMenuItem(
                    value: "Wallpaper",
                    child: Text("Wallpaper"),
                  ),
                ];
              })
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WillPopScope(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        if (messages[index].type == "source") {
                          return OwnMessageCard(
                              message: messages[index].message);
                        } else {
                          return ReplyMessageCard(
                              message: messages[index].message);
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width - 60,
                              child: Card(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2, bottom: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextFormField(
                                  focusNode: focusNode,
                                  controller: textEditingController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 5,
                                  minLines: 1,
                                  onChanged: (value) {
                                    if (value.length > 0) {
                                      setState(() {
                                        sendButton = true;
                                      });
                                    } else {
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Message",
                                    prefixIcon: IconButton(
                                      icon: Icon(
                                        Icons.emoji_emotions,
                                        color: Color(0xFF075E54),
                                      ),
                                      onPressed: () {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.attach_file,
                                            color: Color(0xFF075E54),
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    showAttachment());
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.camera_alt,
                                            color: Color(0xFF075E54),
                                          ),
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                    contentPadding: EdgeInsets.all(5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 8,
                                left: 4,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF075E54),
                                radius: 25,
                                child: IconButton(
                                  onPressed: () {
                                    if (sendButton) {
                                      sendMessage(
                                        textEditingController.text,
                                        widget.sourceChat.id!,
                                        widget.chatModel.id!,
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    sendButton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? emojiPickerSelect() : Container(),
                      ],
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget showAttachment() {
    return Container(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  options(Icons.insert_drive_file, Colors.indigo, "Documents"),
                  SizedBox(
                    width: 40,
                  ),
                  options(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  options(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  options(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  options(Icons.location_pin, Colors.green, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  options(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget emojiPickerSelect() {
    return EmojiPicker(
      config: Config(
        emojiViewConfig: EmojiViewConfig(
          columns: 8,
          buttonMode: ButtonMode.CUPERTINO,
        ),
      ),
      onEmojiSelected: (category, emoji) {
        print(emoji);
        textEditingController.text = textEditingController.text + emoji.emoji;
      },
    );
  }
}
