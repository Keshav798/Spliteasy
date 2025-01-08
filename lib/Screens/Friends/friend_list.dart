import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Models/user_model.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Screens/Friends/Components/friend_component.dart';
import 'package:split_easy/Utils/Encoders/friend_data_encoder.dart';

class FriendList extends StatefulWidget {
  const FriendList({Key? key}) : super(key: key);

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
       return Consumer<UserProvider>(
        builder: (context, value, child) {
          User? user=value.user;
          List<UserFreind>? friends=user!.friendList;
          return ListView.builder(
            itemCount: friends?.length,
            itemBuilder: (context,index){
              return GestureDetector(
                child: FriendComponent(
                  name: friends?[index].name??"no name",
                  money: friends?[index].amount!.toDouble()??0,
                  index: index,
                ),
                onTap: () {
                  String encodedFriendDetails = encodeFriendDetails(friends?[index].userId??"userId");
                  context.go('/friend/$encodedFriendDetails');  // Navigates and updates the URL
                },
              );
            }
            );
        },
      );
  }
}
