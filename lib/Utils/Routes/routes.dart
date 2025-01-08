import 'dart:convert';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Navbar/navbar.dart';
import 'package:split_easy/Screens/Auth/login.dart';
import 'package:split_easy/Screens/Auth/register.dart';
import 'package:split_easy/Screens/Friends/friend_details.dart';
import 'package:split_easy/Screens/Split/split_details.dart';
import 'package:split_easy/Screens/UtilityScreens/error_page.dart';

// Authenticated routes
GoRouter authenticatedRoute = GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const NavBar(),
        ),
        GoRoute(
          path: '/split/:data',
          builder: (context, state) {
            final data = state.pathParameters['data']!;
            try {
              final decodedArgs =
                  jsonDecode(utf8.decode(base64.decode(data))) as Map<String, dynamic>;

              if (decodedArgs['splitId'] == null) {
                return const ErrorPage();
              }

              return SplitDetails(splitId: decodedArgs['splitId']);
            } catch (e) {
              return const ErrorPage();
            }
          },
        ),
        GoRoute(
          path: '/friend/:data',
          builder: (context, state) {
            final data = state.pathParameters['data']!;
            try {
              final decodedArgs =
                  jsonDecode(utf8.decode(base64.decode(data))) as Map<String, dynamic>;

              if (decodedArgs['friendId'] == null) {
                return const ErrorPage();
              }

              return FriendDetails(friendId: decodedArgs['friendId']);
            } catch (e) {
              return const ErrorPage();
            }
          },
        ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
    );

// Non-authenticated routes
GoRouter nonAuthenticatedRoute = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterPage(),
        ),
      ],
      errorBuilder: (context, state) => const ErrorPage(),
    );
