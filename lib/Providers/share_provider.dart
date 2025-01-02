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

  void clearShares() {
    _shares.clear();
    notifyListeners();
  }
}