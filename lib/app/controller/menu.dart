import 'package:get/get.dart';

import 'package:codelivery/app/data/model/menu.dart';
import 'package:codelivery/app/data/repository/menu.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find<MenuController>();

  final MenuRepository repository;

  MenuController({required this.repository});

  final RxList<Menu> _menuList = List<Menu>.empty(growable: true).obs;
  late String tag;

  get menuList => _menuList.value;

  set menuList(value) => _menuList.value = value;

  initMenuList(String restaurantName) => menuList = repository.initMenuList(restaurantName);
}