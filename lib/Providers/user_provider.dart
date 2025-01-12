import 'package:flutter/material.dart';
import 'package:split_easy/Models/user_model.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clearUser() {
    _user = null;
    notifyListeners();
  }

  int getSplitAmount(String splitId){
    List<UserSplit>? userSplits=_user!.splitList;
    if(userSplits==null) return 0;
    for(UserSplit userSplit in userSplits) if(userSplit.splitId==splitId) return userSplit.amount??-99999;
    return 0;
  }

  Map<String,dynamic> getFriend(String friendId){
    List<UserFreind>? friendList=_user!.friendList;
    if(friendList==null) return {
      "name":"unkown",
      "amount":-99999
    };
    for(UserFreind userFreind in friendList) if(userFreind.userId==friendId) return {
      "name":userFreind.name,
      "amount":userFreind.amount
    };
    return {
      "name":"unkown",
      "amount":-99999
    };
  }
}