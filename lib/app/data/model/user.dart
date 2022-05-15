import 'package:codelivery/app/data/model/order.dart';

class User {
  late String nickname;
  late String address;
  late String token;
  late List<Order> orders;

  User({nickname, address, token, orders}) {
    this.nickname = nickname;
    this.address = address;
    this.token = token;
    this.orders = orders;
  }

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    address = json['address'];
    token = json['token'];
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['address'] = address;
    data['token'] = token;
    data['orders'] = orders;
    return data;
  }
}
