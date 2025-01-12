import 'package:flutter/material.dart';
import 'package:split_easy/Models/share_model.dart';

class ShareProvider with ChangeNotifier {
  List<Share> _shares = [];

  List<Share> get shares => _shares;

  void setShares(List<Share> shares) {
    _shares = shares;
    notifyListeners();
  }

  void addShare(Share share) {
    _shares.add(share);
    notifyListeners();
  }

  void removeShare(String shareId) {
    _shares.removeWhere((share) => share.shareId == shareId);
    notifyListeners();
  }

  List<Share> getSplitShares(String splitId) {
    List<Share> splitShares=[];
    for(Share currShare in _shares) if(currShare.split!.splitId==splitId) splitShares.add(currShare);
    return splitShares; 
  }

  List<Share> getFriendtShares(String friendId) {
    List<Share> friendShares=[];
    for(Share currShare in _shares) if(currShare.userPrimary!.userId==friendId || currShare.userSecondary!.userId==friendId) friendShares.add(currShare);
    return friendShares; 
  }

  void clearShares() {
    _shares.clear();
    notifyListeners();
  }
}