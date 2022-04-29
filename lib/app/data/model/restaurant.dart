import 'package:codelivery/app/data/model/Menu.dart';

class Restaurant {
  late String name;
  late List<Menu> menu;
  late int price;

  // menu => name, price, image
  Restaurant({restaurant, food, price});

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['restaurant'];
    menu = json['food'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurant'] = name;
    data['food'] = menu;
    data['price'] = price;
    return data;
  }
}