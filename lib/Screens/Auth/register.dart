import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading=false;

  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController passController=TextEditingController();

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
                  "Join Us!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorFirst,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Create your account",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.colorSecond,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.colorThird.withOpacity(0.1),
                  ),
                ),
                const SizedBox(height: 20),
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
                      // Add your registration logic here

                      if(emailController.text.isEmpty || passController.text.isEmpty || nameController.text.isEmpty){
                      showWarning(context, "Email ,name and Password cannot be empty");
                      return; 
                      }

                      setState(() {
                        _isLoading=true;
                      });

                      bool createdUser=await ApiHelper.registerUser(nameController.text,emailController.text,passController.text,context);
                      if(createdUser){
                        showInformation(context, "User created succesfully, please login");
                        context.go('/login');
                      }

                    },
                    child: const Text("Register"),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: Text(
                      "Already have an account? Login",
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
