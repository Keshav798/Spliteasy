class Share {
  ShareUser? userPrimary;
  ShareUser? userSecondary;
  bool? isPrimary;
  ShareSplit? split;
  String? sId;
  String? title;
  bool? isCleared;
  double? amount;
  String? shareId;
  String? createdAt;
  String? updatedAt;
  double? iV;

  Share(
      {this.userPrimary,
      this.userSecondary,
      this.isPrimary,
      this.split,
      this.sId,
      this.title,
      this.isCleared,
      this.amount,
      this.shareId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Share.fromJson(Map<String, dynamic> json) {
    userPrimary = json['userPrimary'] != null
        ? new ShareUser.fromJson(json['userPrimary'])
        : null;
    userSecondary = json['userSecondary'] != null
        ? new ShareUser.fromJson(json['userSecondary'])
        : null;
    split = json['split'] != null ? new ShareSplit.fromJson(json['split']) : null;
    sId = json['_id'];
    title = json['title'];
    isCleared = json['isCleared'];
    amount = json['amount'];
    shareId = json['shareId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userPrimary != null) {
      data['userPrimary'] = this.userPrimary!.toJson();
    }
    if (this.userSecondary != null) {
      data['userSecondary'] = this.userSecondary!.toJson();
    }
    if (this.split != null) {
      data['split'] = this.split!.toJson();
    }
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['isCleared'] = this.isCleared;
    data['amount'] = this.amount;
    data['shareId'] = this.shareId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class ShareUser {
  String? userId;
  String? userName;

  ShareUser({this.userId, this.userName});

  ShareUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}

class ShareSplit {
  String? splitName;
  String? splitId;

  ShareSplit({this.splitName, this.splitId});

  ShareSplit.fromJson(Map<String, dynamic> json) {
    splitName = json['splitName'];
    splitId = json['splitId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['splitName'] = this.splitName;
    data['splitId'] = this.splitId;
    return data;
  }
}