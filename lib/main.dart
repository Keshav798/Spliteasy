import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Navbar/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      title: 'Split Easy',
      home: NavBar(),
    );
  }
}
