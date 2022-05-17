import 'package:get/get.dart';

import 'package:codelivery/app/controller/restaurant.dart';
import 'package:codelivery/app/data/repository/restaurant.dart';

class RestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(
        () => RestaurantController(repository: RestaurantRepository()));
    RestaurantController.to.getRestaurantList();
  }
}
