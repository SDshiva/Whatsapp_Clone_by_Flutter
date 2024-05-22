import 'package:flutter/material.dart';

class OthersStatusCard extends StatelessWidget {
  const OthersStatusCard({super.key, required this.name, required this.time});
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.blueGrey,
          ),
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: CircleAvatar(
          //     radius: 12,
          //     backgroundColor: Colors.greenAccent,
          //     child: Icon(
          //       Icons.add,
          //       size: 15,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(
          // fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Today at, $time",
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
