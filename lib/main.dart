import 'package:chat_app_web_socket_io/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        fontFamily: "OpenSans",
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF075E54),
            shadowColor: Color(0xFF128C7E),
            // color: Colors.white,
            foregroundColor: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}
