import 'package:flutter/material.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'dart:html' as html;

class AddFriendDialog extends StatefulWidget {
  const AddFriendDialog({Key? key}) : super(key: key);

  @override
  State<AddFriendDialog> createState() => _AddFriendDialogState();
}

class _AddFriendDialogState extends State<AddFriendDialog> {
  final TextEditingController _emailController = TextEditingController();
    bool _isLoading=false;


  @override
  Widget build(BuildContext context) {
    return _isLoading?LoadingPage(): Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Add Friend",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorFirst,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Enter the email of the friend you wanna add",
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: AppColors.colorThird,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Friend's Email",
                filled: true,
                fillColor: AppColors.colorFourth.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.colorThird),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async{
                // Handle adding the friend
                if(_emailController.text.isEmpty){
                  showWarning(context, "Enter email");
                  return;
                }
                setState(() {
                  _isLoading=true;
                });

                bool added=await ApiHelper.addFriend(_emailController.text, context);

                setState(() {
                  _isLoading=false;
                });

                if(added){
                  showInformation(context, "Friend added successfully");
                  Future.delayed(Duration(seconds: 1));
                  html.window.location.reload();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorSecond,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Add Friend"),
            ),
          ],
        ),
      ),
    );
  }
}
