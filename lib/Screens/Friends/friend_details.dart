import 'package:flutter/material.dart';

class FriendDetails extends StatefulWidget {
  final String friendId;

  const FriendDetails({
    Key? key,
    required this.friendId
  }) : super(key: key);

  @override
  State<FriendDetails> createState() => _FriendDetailsState();
}

class _FriendDetailsState extends State<FriendDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.friendId ));
  }
}