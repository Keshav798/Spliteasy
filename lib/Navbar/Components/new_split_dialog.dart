import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Screens/UtilityScreens/warning.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'dart:html' as html;

class NewSplitDialog extends StatefulWidget {
  const NewSplitDialog({Key? key}) : super(key: key);

  @override
  State<NewSplitDialog> createState() => _NewSplitDialogState();
}

class _NewSplitDialogState extends State<NewSplitDialog> {
  bool _isLoading=false;
  final TextEditingController _splitNameController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  List<Map<String,dynamic>> _friends = []; // Sample data
  List<Map<String,dynamic>> _filteredFriends = [];
  final Set<Map<String,dynamic>> _selectedFriends = {};

  @override
  void initState() {
    super.initState();
    _friends=Provider.of<UserProvider>(context, listen: false).getFriends();
    _filteredFriends = _friends;
  }

  void _filterFriends(String query) {
    setState(() {
      _filteredFriends = _friends
          .where((friend) => friend["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

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
                "New Split",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                "Only friends can be added to the new split",
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _splitNameController,
              decoration: InputDecoration(
                labelText: "Split Name",
                filled: true,
                fillColor: AppColors.colorFourth.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.colorThird),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: _filterFriends,
              decoration: InputDecoration(
                labelText: "Search Friends",
                prefixIcon: Icon(Icons.search, color: AppColors.colorThird),
                filled: true,
                fillColor: AppColors.colorFourth.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: AppColors.colorThird),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredFriends.length,
                itemBuilder: (context, index) {
                  final friend = _filteredFriends[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.colorFourth.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        friend["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: _selectedFriends.contains(friend),
                      onChanged: (isSelected) {
                        setState(() {
                          if (isSelected == true) {
                            _selectedFriends.add(friend);
                          } else {
                            _selectedFriends.remove(friend);
                          }
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async{
                // Handle adding the split
                if(_splitNameController.text.isEmpty){
                  showWarning(context, "Title cannot be empty");
                  return;
                }
                print(_selectedFriends);
                List<String> userIdList=[];
                for(dynamic user in _selectedFriends) userIdList.add(user["friendId"]);

                setState(() {
                  _isLoading=true;
                });

                bool created=await ApiHelper.createSplit(_splitNameController.text, userIdList, context);

                setState(() {
                  _isLoading=false;
                });

                if(created) {
                  showInformation(context, "Split created successfuly");
                  await Future.delayed(Duration(seconds: 1));
                  html.window.location.reload();
                }

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.colorSecond,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Add Split"),
            ),
          ],
        ),
      ),
    );
  }
}
