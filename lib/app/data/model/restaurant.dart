import 'package:codelivery/app/data/model/menu.dart';

class Restaurant {
  late String thumbnail;
  late String name;
  late double starRating;
  late int minDeliveryTime;
  late int maxDeliveryTime;
  late int minOrderAmount;
  late int minDeliveryTip;
  late int maxDeliveryTip;
  late double distance;
  late List<Menu> menu;

  // menu => name, price, image
  Restaurant(
      {thumbnail,
      name,
      starRating,
      minDeliveryTime,
      maxDeliveryTime,
      minOrderAmount,
      minDeliveryTip,
      maxDeliveryTip,
      distance,
      menu}) {
    this.thumbnail = thumbnail;
    this.name = name;
    this.starRating = starRating;
    this.minDeliveryTime = minDeliveryTime;
    this.maxDeliveryTime = maxDeliveryTime;
    this.minOrderAmount = minOrderAmount;
    this.minDeliveryTip = minDeliveryTip;
    this.maxDeliveryTip = maxDeliveryTip;
    this.distance = distance;
    this.menu = menu;
  }

  Restaurant.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    name = json['name'];
    starRating = json['starRating'];
    minDeliveryTime = json['minDeliveryTime'];
    maxDeliveryTime = json['maxDeliveryTime'];
    minOrderAmount = json['minOrderAmount'];
    minDeliveryTip = json['minDeliveryTip'];
  maxDeliveryTip = json['maxDeliveryTip'];
    distance = json['distance'];
    menu = json['menu'];
  }
}
