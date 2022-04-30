import 'package:codelivery/app/data/model/restaurant.dart';
import 'package:codelivery/app/data/repository/restaurant.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  late final RestaurantRepository repository;

  RestaurantController({required this.repository});

  final _restaurantList = <Restaurant>[].obs;

  final _restaurant = Restaurant().obs;

  get restaurantList => _restaurantList.value;

  set restaurantList(value) => _restaurantList.value = value;

  get restaurant => _restaurant.value;

  set restaurant(value) => _restaurant.value = value;

  getAll() {
    repository.getAll().then((data) {
      restaurantList = data;
    });
  }
}