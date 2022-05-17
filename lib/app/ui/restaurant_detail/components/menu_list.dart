import 'package:codelivery/app/controller/restaurant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/menu.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class MenuList extends GetView<RestaurantController> {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuController = Get.find<MenuController>(tag: Get.arguments['tag']);

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: BottomShadowCard(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              for (int i = 0; i < menuController.menuList.length; i++)
                InkWell(
                    onTap: () {
                      Get.toNamed('/restaurant_detail/menu_detail', arguments: {
                        'index': i,
                        'tag': menuController.tag,
                        'restaurant': controller.restaurantList[Get.arguments['index']]
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menuController.menuList[i].name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: kDefaultPadding,
                                ),
                                Text(
                                  menuController.menuList[i].price.toString() + "원",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(""),
                              ],
                            )),
                        if (i != menuController.menuList.length - 1) Divider()
                      ],
                    ))
            ])));
  }
}
