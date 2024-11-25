import 'package:flutter/material.dart';
import 'package:split_easy/Screens/Friends/Components/friend_component.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <FriendComponent>[
        FriendComponent(
          name: "Keshav",
          money: 345,
          index: 0,
        ),
        FriendComponent(
          name: "Harsh",
          money: -2346,
          index: 1,
        ),
        FriendComponent(
          name: "Virat",
          money: 0,
          index: 0,
        ),
        FriendComponent(
          name: "Samson",
          money: 0,
          index: 1,
        ),
      ],
    );
  }
}
