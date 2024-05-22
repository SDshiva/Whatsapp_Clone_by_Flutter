import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OwnStatuscard extends StatelessWidget {
  const OwnStatuscard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.blueGrey,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.greenAccent,
              child: Icon(
                Icons.add,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "My status",
        style: TextStyle(
          // fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "Tap to add status update",
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
