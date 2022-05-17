import 'package:get/get.dart';

import 'package:codelivery/app/data/model/menu.dart';
import 'package:codelivery/app/data/repository/menu.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find<MenuController>();

  final MenuRepository repository;

  MenuController({required this.repository});

  final RxList<Menu> _menuList = List<Menu>.empty(growable: true).obs;
  late String tag;
  RxBool _enableSubMenuAmount = false.obs;
  RxBool _enableAddMenuAmount = true.obs;

  get menuList => _menuList.value;

  set menuList(value) => _menuList.value = value;

  get enableSubMenuAmount => _enableSubMenuAmount.value;

  set enableSubMenuAmount(value) => _enableSubMenuAmount.value = value;

  get enableAddMenuAmount => _enableAddMenuAmount.value;

  set enableAddMenuAmount(value) => _enableAddMenuAmount.value = value;

  initMenuList(String restaurantName) =>
      menuList = repository.initMenuList(restaurantName);

  subMenuAmount(int index) {
    if (menuList[index].amount != 1) {
      menuList[index].amount -= 1;
      if (menuList[index].amount < 10) {
        enableAddMenuAmount = true;
      }
      if (menuList[index].amount == 1) {
        enableSubMenuAmount = false;
      }
      _menuList.refresh();
    }
  }

  addMenuAmount(int index) {
    if (menuList[index].amount != 10) {
      menuList[index].amount += 1;
      if (menuList[index].amount > 1) {
        enableSubMenuAmount = true;
      }
      if (menuList[index].amount == 10) {
        enableAddMenuAmount = false;
      }
      _menuList.refresh();
    }
  }
}
