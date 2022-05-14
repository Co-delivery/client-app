import 'package:codelivery/app/data/model/order.dart';

class User {
  late String nickname;
  late String address;
  late List<Order> orders;

  User({nickname, address, orders}) {
    this.nickname = nickname;
    this.address = address;
    this.orders = orders;
  }

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    address = json['address'];
    orders = json['orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['address'] = address;
    data['orders'] = orders;
    return data;
  }
}
