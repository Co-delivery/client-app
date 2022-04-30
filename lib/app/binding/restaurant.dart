import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:codelivery/app/controller/restaurant.dart';
import 'package:codelivery/app/data/provider/api.dart';
import 'package:codelivery/app/data/repository/restaurant.dart';

class RestaurantBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(() {
      return RestaurantController(
          repository: RestaurantRepository(
              apiClient: ApiClient(httpClient: http.Client())));
    });
  }
}
