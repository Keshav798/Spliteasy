import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Providers/share_provider.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Screens/SplashScreen/splash_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ShareProvider()),
      ],
      child: MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

