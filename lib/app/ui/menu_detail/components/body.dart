import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/menu.dart';
import 'package:codelivery/app/ui/menu_detail/components/adjust_amount_button.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class MenuDetailBody extends GetView {
  const MenuDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuController>(tag: Get.arguments['tag']);
    final menu = controller.menuList[Get.arguments['index']];

    return SingleChildScrollView(
      child: Container(
          color: Colors.white,
          child: BottomShadowCard(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    menu.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("가격",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Text(menu.price.toString() + "원",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  )),
              const Divider(),
              Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text("수량",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      AdjustAmountButton()
                    ],
                  )),
            ],
          ))),
    );
  }
}
