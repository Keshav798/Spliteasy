
class User {
  String? sId;
  String? name;
  String? email;
  String? password;
  int? totalOwed;
  int? totalLended;
  String? userId;
  List<UserSplit>? splitList;
  List<UserFreind>? friendList;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.totalOwed,
      this.totalLended,
      this.userId,
      this.splitList,
      this.friendList,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    totalOwed = json['totalOwed'];
    totalLended = json['totalLended'];
    userId = json['userId'];
    if (json['splitList'] != null) {
      splitList = <UserSplit>[];
      json['splitList'].forEach((v) {
        splitList!.add(new UserSplit.fromJson(v));
      });
    }
    if (json['friendList'] != null) {
      friendList = <UserFreind>[];
      json['friendList'].forEach((v) {
        friendList!.add(new UserFreind.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['totalOwed'] = this.totalOwed;
    data['totalLended'] = this.totalLended;
    data['userId'] = this.userId;
    if (this.splitList != null) {
      data['splitList'] = this.splitList!.map((v) => v.toJson()).toList();
    }
    if (this.friendList != null) {
      data['friendList'] = this.friendList!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class UserSplit {
  String? splitId;
  String? splitTitle;
  int? amount;
  String? sId;

  UserSplit({this.splitId, this.splitTitle, this.amount, this.sId});

  UserSplit.fromJson(Map<String, dynamic> json) {
    splitId = json['splitId'];
    splitTitle = json['splitTitle'];
    amount = json['amount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['splitId'] = this.splitId;
    data['splitTitle'] = this.splitTitle;
    data['amount'] = this.amount;
    data['_id'] = this.sId;
    return data;
  }
}

class UserFreind {
  String? userId;
  String? name;
  int? amount;
  List<String>? shareList;
  String? sId;

  UserFreind({this.userId, this.name, this.amount, this.shareList, this.sId});

  UserFreind.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    amount = json['amount'];
    shareList = json['shareList'].cast<String>();
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['name'] = this.name;
    data['amount'] = this.amount;
    data['shareList'] = this.shareList;
    data['_id'] = this.sId;
    return data;
  }
}