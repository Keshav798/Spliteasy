import 'package:flutter/material.dart';
import 'package:split_easy/Screens/UtilityScreens/information.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'dart:html' as html;

class ClearShareDialog extends StatefulWidget {
  final String shareId;

  const ClearShareDialog({Key? key,required this.shareId}) : super(key: key);

  @override
  State<ClearShareDialog> createState() => _AddShareDialogState();
}

class _AddShareDialogState extends State<ClearShareDialog> {
  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    return _isLoading?LoadingPage(): AlertDialog(
      backgroundColor: AppColors.colorFourth,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text(
        "Clear or Delete Share",
        style: TextStyle(color: Colors.white),
      ),
      content: Column(
        children: [
          const Text(
            "Are you sure you want to clear or delete this share?",
            style: TextStyle(color: Colors.white),
          ),
          
          const Text(
            "Share will automatically be cleared when deleted",
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic
            ),
          ),
        ],
      ), 
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: AppColors.colorFirst),
          onPressed: () async {
            setState(() {
              _isLoading=true;
            });

            bool cleared=await ApiHelper.clearShare(widget.shareId, context);

            setState(() {
              _isLoading=false;
            });

            if(cleared){
              showInformation(context, "Share cleared");
              await Future.delayed(Duration(seconds: 1));
              html.window.location.reload();
            }
            Navigator.of(context).pop();
          },
          child: const Text("Clear"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            setState(() {
              _isLoading=true;
            });

            bool deleted=await ApiHelper.deleteShare(widget.shareId, context);

            setState(() {
              _isLoading=false;
            });

            if(deleted){
              showInformation(context, "Share cleared and deleted");
              await Future.delayed(Duration(seconds: 1));
              html.window.location.reload();
            }
            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        ),
      ],
    );
  }
}
