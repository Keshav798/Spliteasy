import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'package:split_easy/Models/user_model.dart';
import 'package:split_easy/Providers/user_provider.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({super.key});

  @override
  State<ProfileComponent> createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent> {
  String userName = "John Doe";
  String userHandle = "@johndoe";
  String profilePhotoUrl =
      "https://via.placeholder.com/150"; // Replace with actual photo URL
  double totalOwed = 120.50;
  double totalToReceive = 250.75;

  @override
  Widget build(BuildContext context) {
    User? user=Provider.of<UserProvider>(context).user;
    userName=user!.name??"no name";
    userHandle=user.email??"no email";
    totalOwed=user.totalOwed!.toDouble();
    totalToReceive=user.totalLended!.toDouble();


    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Determine container size based on breakpoints
    double containerWidth;
    double containerHeight;

    if (screenWidth > 1200) {
      containerWidth = screenWidth * 0.25;
      containerHeight = screenHeight * 0.4;
    } else if (screenWidth > 600) {
      containerWidth = screenWidth * 0.4;
      containerHeight = screenHeight * 0.6;
    } else {
      containerWidth = screenWidth;
      containerHeight = screenHeight * 0.9;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: screenHeight * 0.02,
        right: screenWidth > 600 ? screenWidth * 0.02 : 0,
      ),
      child: Align(
        alignment: screenWidth > 600 ? Alignment.topRight : Alignment.topCenter,
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          child: Container(
            width: containerWidth,
            height: containerHeight,
            padding: EdgeInsets.all(screenWidth * 0.01),
            decoration: BoxDecoration(
              color: AppColors.colorSecond,
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Photo
                CircleAvatar(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.edit,
                      size: containerWidth * 0.1 * 0.5,
                    ),
                  ),
                  radius: containerWidth * 0.1, // Responsive size
                  backgroundImage: NetworkImage(profilePhotoUrl),
                ),
                SizedBox(height: containerHeight * 0.02),

                // Name and Username
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName + " ",
                      style: TextStyle(
                        fontSize: containerWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.edit,
                      size: containerWidth * 0.1 * 0.5,
                    )
                  ],
                ),
                Text(
                  userHandle,
                  style: TextStyle(
                    fontSize: containerWidth * 0.04,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: containerHeight * 0.02),

                // Financial Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Owed:",
                          style: TextStyle(
                            fontSize: containerWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "₹${totalOwed.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: containerWidth * 0.04,
                            color: Colors.red[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total to Receive:",
                          style: TextStyle(
                            fontSize: containerWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "₹${totalToReceive.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: containerWidth * 0.04,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: containerHeight * 0.02),

                // Row for Buttons with Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Copy credentials logic
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: Icon(
                        Icons.copy,
                        size: containerWidth * 0.04, // Icon scaled to text size
                      ),
                      label: Text(
                        "Copy Credentials",
                        style: TextStyle(fontSize: containerWidth * 0.04),
                      ),
                    ),
                    // TextButton.icon(
                    //   onPressed: () {
                    //     // Edit profile logic
                    //   },
                    //   style: TextButton.styleFrom(
                    //     foregroundColor: Colors.white,
                    //   ),
                    //   icon: Icon(
                    //     Icons.edit,
                    //     size: containerWidth * 0.04, // Icon scaled to text size
                    //   ),
                    //   label: Text(
                    //     "Edit Profile",
                    //     style: TextStyle(fontSize: containerWidth * 0.04),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
