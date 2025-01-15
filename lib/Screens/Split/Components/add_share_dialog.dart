import 'package:flutter/material.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'dart:html' as html;

class AddShareDialog extends StatefulWidget {
  final List<dynamic> users;
  final String splitId;

  const AddShareDialog({Key? key, required this.users,required this.splitId}) : super(key: key);

  @override
  State<AddShareDialog> createState() => _AddShareDialogState();
}

class _AddShareDialogState extends State<AddShareDialog> {
  bool _isLoading=false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final Map<String, bool> _selectedUsers = {};

  @override
  void initState() {
    super.initState();
    for (var user in widget.users) {
      _selectedUsers[user["userId"]] = false;
    }
  }

  Future<void> _submit() async {
    String title = _titleController.text.trim();
    double? amount = double.tryParse(_amountController.text.trim());

    if (title.isEmpty || amount == null || amount <= 0) {
      showWarning(context, "Please enter a valid title and amount.");
      return;
    }

    List<String> selectedUserIds = _selectedUsers.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    if (selectedUserIds.isEmpty) {
      showWarning(context, "Please select at least one user.");
      return;
    }

    // Replace this with the actual logic to add a share
    print("Title: $title");
    print("Amount: $amount");
    print("Selected Users: $selectedUserIds");
    double eachAmount=amount/(selectedUserIds.length+1);
    print("Each amount:$eachAmount");

    int ctr=0;
    setState(() {
      _isLoading=true;
    });
    for(String userId in selectedUserIds){
      bool created=await ApiHelper.createShare(title, userId, eachAmount, widget.splitId, context);
      if(created) ctr++;
    }
    setState(() {
      _isLoading=false;
    });

    if(ctr==0) {
      showWarning(context, "Try again");
      return;
    }
    else if(ctr==selectedUserIds.length) showInformation(context, "Shares created");
    else if(ctr<selectedUserIds.length && ctr>0) showWarning(context, "Some shares my not have been created");

    await Future.delayed(Duration(seconds: 1));
    html.window.location.reload();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading?LoadingPage(): AlertDialog(
      backgroundColor: AppColors.colorFourth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        "Add New Share",
        style: TextStyle(color: Colors.white),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(color: AppColors.colorFirst),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colorFirst),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(color: AppColors.colorFirst),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.colorFirst),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              "Select Participants:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            ...widget.users.map((user) {
              return CheckboxListTile(
                value: _selectedUsers[user["userId"]],
                onChanged: (value) {
                  setState(() {
                    _selectedUsers[user["userId"]] = value ?? false;
                  });
                },
                title: Text(
                  user["name"],
                  style: const TextStyle(color: Colors.white),
                ),
                activeColor: AppColors.colorFirst,
                checkColor: Colors.white,
                contentPadding: EdgeInsets.zero,
              );
            }).toList(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.colorFirst),
          onPressed: () async {await _submit();},
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
