import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/data/model/menu.dart';
import 'package:codelivery/app/data/model/restaurant.dart';

import 'package:codelivery/app/data/repository/menu.dart';

class MenuController extends GetxController {
  static MenuController get to => Get.find<MenuController>();

  final MenuRepository repository;

  MenuController({required this.repository});

  late Restaurant restaurant;
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

  addMenuToOrder(Menu menu) {
    // 이미 주문이 있을 경우
    if (OrderController.to.orderRestaurant != null) {
      // 같은 음식점인 경우
      if (OrderController.to.orderRestaurant?.name == restaurant.name) {
        // 새로운 음식인 경우
        if (OrderController.to.orderList
                .any((item) => item.value.name == menu.name) !=
            true) {
          Rx<Menu> temp = Menu.fromJson(menu.toJson()).obs;
          OrderController.to
              .addMenu(temp, enableSubMenuAmount, enableAddMenuAmount);
        }
        // 새로운 음식이 아닌 경우
        else {
          OrderController.to
              .updateMenu(menu, enableSubMenuAmount, enableAddMenuAmount);
        }
      }
      // 다른 음식점인 경우
      else {
        DialogController.to.openDialog("장바구니에는 같은 가게의 메뉴만\n담을 수 있습니다.",
            "선택하신 메뉴를 장바구니에 담을 경우,\n이전에 담은 메뉴가 삭제됩니다.", [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("취소")),
          TextButton(
              onPressed: () {
                Rx<Menu> temp = Menu.fromJson(menu.toJson()).obs;
                OrderController.to.orderRestaurant = restaurant;
                OrderController.to.expectedPrice = 0;
                OrderController.to.orderList = <Rx<Menu>>[];
                OrderController.to
                    .addMenu(temp, enableSubMenuAmount, enableAddMenuAmount);
                Get.back();
                Get.back();
              },
              child: Text("담기")),
        ]);
      }
    }
    // 주문이 아예 없는 경우
    else {
      OrderController.to.orderRestaurant = restaurant;
      Rx<Menu> temp = Menu.fromJson(menu.toJson()).obs;
      OrderController.to
          .addMenu(temp, enableSubMenuAmount, enableAddMenuAmount);
    }
  }
}
