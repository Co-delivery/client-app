import 'package:codelivery/app/data/model/order.dart';

class User {
  late String nickname;
  late String address;
  late String token;
  late Order? order;

  User({nickname, address, token}) {
    this.nickname = nickname;
    this.address = address;
    this.token = token;
  }

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    address = json['address'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['address'] = address;
    data['token'] = token;
    return data;
  }
}
