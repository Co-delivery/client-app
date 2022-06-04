import 'package:codelivery/app/data/model/order.dart';

class User {
  late String userId;
  late String nickname;
  late String address;
  late String token;
  late Order? order;

  User({userId, nickname, address, token}) {
    this.userId = userId;
    this.nickname = nickname;
    this.address = address;
    this.token = token;
  }

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userID'];
    nickname = json['nickname'];
    address = json['address'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userId;
    data['nickname'] = nickname;
    data['address'] = address;
    data['token'] = token;
    return data;
  }
}
