import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_easy/Routes/routes.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  bool isValidated = true;

  Future<bool> getValidation() async {
    await Future.delayed(Duration(seconds: 5));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token")=="token";
  }

  Future<void> validate() async {
    debugPrint("Function called");
    isValidated = await getValidation();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    validate();
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return MaterialApp(home: LoadingPage());
    }

    final router=isValidated
                ? authenticatedRoute // Pass current route
                : nonAuthenticatedRoute;

    return MaterialApp.router(
            theme: ThemeData(brightness: Brightness.dark),
            title: 'Split Easy',
            routerConfig: router,
          );
  }
}
