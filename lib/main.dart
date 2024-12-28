import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Navbar/navbar.dart';
import 'package:split_easy/Screens/Friends/friend_details.dart';
import 'package:split_easy/Screens/Split/split_details.dart';
import 'package:split_easy/Screens/UtilityScreens/error_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(brightness: Brightness.dark),
      title: 'Split Easy',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    routes: [
      // Define the main route
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const NavBar();
        },
      ),
      // Route for Split Details
      GoRoute(
        path: '/split/:data',
        builder: (context, state) {
          final data = state.pathParameters['data']!;
          try {
            final decodedArgs = jsonDecode(utf8.decode(base64.decode(data))) as Map<String, dynamic>;

            if (decodedArgs['splitId'] == null) {
              return const ErrorPage();
            }

            return SplitDetails(
              splitId: decodedArgs['splitId'],
            );
          } catch (e) {
            return const ErrorPage();
          }
        },
        // onExit: (context, state) {
        //   GoRouter.of(context).go("/");
        //   return true;
        // },
      ),
      // Route for Friend Details
      GoRoute(
        path: '/friend/:data',
        
        builder: (context, state) {
          final data = state.pathParameters['data']!;
          try {
            final decodedArgs = jsonDecode(utf8.decode(base64.decode(data))) as Map<String, dynamic>;

            if (decodedArgs['friendId'] == null) {
              return const ErrorPage();
            }

            return FriendDetails(
              friendId: decodedArgs['friendId']
            );
          } catch (e) {
            return const ErrorPage();
          }
        },
        // onExit: (context, state) {
        //   GoRouter.of(context).go("/");
        //   return true;
        // },
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
