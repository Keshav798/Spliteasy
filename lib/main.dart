import 'package:flutter/material.dart';
import 'package:split_easy/Screens/SplashScreen/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

