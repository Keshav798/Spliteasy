import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Screens/Friends/Components/friend_component.dart';
import 'package:split_easy/Utils/friend_data_encoder.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <GestureDetector>[
        GestureDetector(
          child: FriendComponent(
            name: "Keshav",
            money: 345,
            index: 0,
          ),
          onTap: () {
            String encodedFriendDetails = encodeFriendDetails("friendId");
            context.go('/friend/$encodedFriendDetails');  // Navigates and updates the URL
          },
        ),
        GestureDetector(
          child: FriendComponent(
            name: "Harsh",
            money: -2346,
            index: 1,
          ),
        ),
        GestureDetector(
          child: FriendComponent(
            name: "Virat",
            money: 0,
            index: 0,
          ),
        ),
        GestureDetector(
          child: FriendComponent(
            name: "Samson",
            money: 0,
            index: 1,
          ),
        ),
      ],
    );
  }
}
