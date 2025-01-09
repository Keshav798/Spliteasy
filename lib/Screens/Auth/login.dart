import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'dart:html' as html;

import 'package:split_easy/Utils/SharedPreferences/shared_preferences_helper.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading=false;

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _isLoading?LoadingPage():Scaffold(
      backgroundColor: AppColors.colorFourth,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorFirst,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Login to your account",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.colorSecond,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.colorThird.withOpacity(0.1),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.colorThird.withOpacity(0.1),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.colorFirst,
                    ),
                    onPressed: () async {

                      print("email :"+emailController.text);
                      print("pass :"+passController.text);

                      if(emailController.text.isEmpty || passController.text.isEmpty){
                      showWarning(context, "Email and Password cannot be empty");
                      return; 
                      }

                      setState(() {
                        _isLoading=true;
                      });                    

                      String? string = await ApiHelper.loginUser(emailController.text, passController.text,context);
                      print("string: "+string.toString());

                      if(string==null) {
                        setState(() {
                          _isLoading=false;
                        });
                        return;
                      }

                      String token=string.split(':')[0];
                      String userId=string.split(':')[1];

                      print("userId: "+userId);

                      await SharedPreferencesHelper.setAuthToken(token);
                      await SharedPreferencesHelper.setUserId(userId);

                      // Proceed with your login logic
                      print("Value saved successfully!");
                      setState(() {
                          _isLoading=false;
                        });
                      showInformation(context, "Login succesfull");
                      html.window.location.reload();
                    },
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.go('/register');
                    },
                    child: Text(
                      "Not a user? Register",
                      style: TextStyle(color: AppColors.colorFirst),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
