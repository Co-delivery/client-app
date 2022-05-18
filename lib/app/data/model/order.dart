import 'package:codelivery/app/data/model/menu.dart';
import 'package:codelivery/app/data/model/restaurant.dart';

class Order {
  late Restaurant restaurant;
  late List<Menu> menuList;
  late int price;

  Order({restaurant, menu, price});

  Order.fromJson(Map<String, dynamic> json) {
    restaurant = json['restaurant'];
    menuList = json['food'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant'] = restaurant;
    data['food'] = menuList;
    data['price'] = price;
    return data;
  }
}