import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/menu.dart';
import 'package:codelivery/app/ui/restaurant_detail/components/bottom_shadow_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/restaurant.dart';

class MenuList extends GetView<RestaurantController> {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuController>(tag: Get.arguments['tag']);
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: BottomShadowCard(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              for (var menu in controller.menuList)
                Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menu.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(
                          menu.price.toString() + "원",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(""),
                        if (menu != controller.menuList.last) Divider()
                      ],
                    ))
            ])));
  }
}
