import 'package:codelivery/app/ui/restaurant_detail/restaurant_detail.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/data/model/restaurant.dart';
import 'package:codelivery/app/data/repository/restaurant.dart';

import 'package:codelivery/app/controller/menu.dart';
import 'package:codelivery/app/data/repository/menu.dart';

class RestaurantController extends GetxController {
  static RestaurantController get to => Get.find<RestaurantController>();
  late final RestaurantRepository repository;

  RestaurantController({required this.repository});

  @override
  void onInit() {
    getRestaurantList();
    super.onInit();
  }

  final RxList<Restaurant> _restaurantList =
      List<Restaurant>.empty(growable: true).obs;

  get restaurantList => _restaurantList.value;

  set restaurantList(value) => _restaurantList.value = value;

  getRestaurantList() {
    restaurantList = repository.getRestaurantList();
    _restaurantList.refresh();
  }

  toDetailPage(int index) {
    Get.to(() => RestaurantDetailPage(),
        arguments: {'tag': restaurantList[index].name, 'index': index},
        binding: BindingsBuilder(() {
      Get.put(MenuController(repository: MenuRepository()),
          tag: restaurantList[index].name);

      final menuController =
          Get.find<MenuController>(tag: restaurantList[index].name);
      menuController.tag = restaurantList[index].name;
      menuController.initMenuList(restaurantList[index].name);
    }));
  }
}
