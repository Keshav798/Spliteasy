import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_easy/Constants/colors.dart';
import 'dart:html' as html;

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.colorThird.withOpacity(0.1),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
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
                      // Add your login logic here
                     // Obtain shared preferences instance
                    final SharedPreferences prefs = await SharedPreferences.getInstance();

                    // Save a value to SharedPreferences
                    await prefs.setString("token", "token");

                    // Proceed with your login logic
                    print("Value saved successfully!");
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
