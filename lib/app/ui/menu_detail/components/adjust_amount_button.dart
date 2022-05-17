import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/menu.dart';

class AdjustAmountButton extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuController>(tag: Get.arguments['tag']);
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.45,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(const Radius.circular(30)),
        ),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () =>
                        controller.subMenuAmount(Get.arguments['index']),
                    icon: Icon(
                      Icons.remove_rounded,
                      color: controller.enableSubMenuAmount
                          ? Colors.black
                          : kDisableColor,
                    )),
                Text(
                  controller.menuList[Get.arguments['index']].amount
                          .toString() +
                      "개",
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                    onPressed: () =>
                        controller.addMenuAmount(Get.arguments['index']),
                    icon: Icon(
                      Icons.add_rounded,
                      color: controller.enableAddMenuAmount
                          ? Colors.black
                          : kDisableColor,
                    )),
              ],
            )));
  }
}
