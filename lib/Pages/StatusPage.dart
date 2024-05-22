import 'package:chat_app_web_socket_io/Custom%20UI/StatusPage/OthersStatusCard.dart';
import 'package:chat_app_web_socket_io/Custom%20UI/StatusPage/OwnStatusCard.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 55,
            width: 55,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color(0xFF075E54),
              elevation: 8,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFF128C7E),
            elevation: 5,
            shape: CircleBorder(
              side: BorderSide.none,
            ),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OwnStatuscard(),
            label("Recent Updates"),
            OthersStatusCard(name: "Sajjad Bro", time: "12.00"),
            OthersStatusCard(name: "Tapas Bro", time: "16.00"),
            OthersStatusCard(name: "Yasin Bro", time: "22.00"),
            label("Viewed Updates")
          ],
        ),
      ),
    );
  }

  Widget label(String label) {
    return Container(
      height: 35,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 6,
        ),
        child: Text(
          textAlign: TextAlign.start,
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
