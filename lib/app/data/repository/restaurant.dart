import 'package:codelivery/app/data/model/restaurant.dart';
import 'package:codelivery/app/data/model/menu.dart';

class RestaurantRepository {
  getRestaurantList() => restaurantList;
}

List<Restaurant> restaurantList = [
  Restaurant(
      thumbnail: "assets/images/1.jpeg",
      name: "성호네 스끼야끼",
      starRating: 4.9,
      minDeliveryTime: 25,
      maxDeliveryTime: 39,
      minOrderAmount: 18000,
      minDeliveryTip: 2000,
      maxDeliveryTip: 4500,
      distance: 1.1,
      menu: <Menu>[]),
  Restaurant(
      thumbnail: "assets/images/2.jpeg",
      name: "상진네 쌈밥",
      starRating: 4.9,
      minDeliveryTime: 27,
      maxDeliveryTime: 37,
      minOrderAmount: 15000,
      minDeliveryTip: 2500,
      maxDeliveryTip: 4000,
      distance: 0.9,
      menu: <Menu>[]),
  Restaurant(
      thumbnail: "assets/images/3.jpeg",
      name: "성규네 횟집",
      starRating: 4.9,
      minDeliveryTime: 30,
      maxDeliveryTime: 42,
      minOrderAmount: 18000,
      minDeliveryTip: 2000,
      maxDeliveryTip: 5000,
      distance: 1.3,
      menu: <Menu>[]),
  Restaurant(
      thumbnail: "assets/images/4.jpeg",
      name: "석주네 중국집",
      starRating: 4.9,
      minDeliveryTime: 13,
      maxDeliveryTime: 27,
      minOrderAmount: 12000,
      minDeliveryTip: 1500,
      maxDeliveryTip: 4500,
      distance: 1.2,
      menu: <Menu>[]),
  Restaurant(
      thumbnail: "assets/images/5.jpeg",
      name: "진이네 떡볶이",
      starRating: 4.9,
      minDeliveryTime: 25,
      maxDeliveryTime: 36,
      minOrderAmount: 14000,
      minDeliveryTip: 3000,
      maxDeliveryTip: 5000,
      distance: 0.8,
      menu: <Menu>[]),
];
