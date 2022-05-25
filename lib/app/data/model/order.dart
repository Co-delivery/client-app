import 'package:codelivery/app/data/model/menu.dart';
import 'package:codelivery/app/data/model/restaurant.dart';

class Order {
  late Restaurant restaurant;
  late List<Menu> menuList;
  late int orderAmount;
  late int deliveryFee;

  Order({restaurant, menu, orderAmount, deliveryFee});

  Order.fromJson(Map<String, dynamic> json) {
    restaurant = json['restaurant'];
    menuList = json['food'];
    orderAmount = json['orderAmount'];
    deliveryFee = json['deliveryFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant'] = restaurant;
    data['food'] = menuList;
    data['orderAmount'] = orderAmount;
    data['deliveryFee'] = deliveryFee;
    return data;
  }
}