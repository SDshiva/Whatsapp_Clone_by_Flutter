import 'package:chat_app_web_socket_io/Models/ChatModel.dart';
import 'package:chat_app_web_socket_io/Pages/CameraPage.dart';
import 'package:chat_app_web_socket_io/Pages/ChatsPage.dart';
import 'package:chat_app_web_socket_io/Pages/StatusPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.chatModels, required this.soureChat});
  final List<ChatModel> chatModels;
  final ChatModel soureChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: "New Group",
                  child: Text("New Group"),
                ),
                const PopupMenuItem(
                  value: "New Broadcast",
                  child: Text("New Broadcast"),
                ),
                const PopupMenuItem(
                  value: "Linked Device",
                  child: Text("Linked Device"),
                ),
                const PopupMenuItem(
                  value: "Starred Message",
                  child: Text("Starred Message"),
                ),
                const PopupMenuItem(
                  value: "Settings",
                  child: Text("Settings"),
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          CameraPage(),
          ChatsPage(
            chatModels: widget.chatModels,
            sourceChat: widget.soureChat,
          ),
          StatusPage(),
          Text("Calls"),
        ],
      ),
    );
  }
}
