import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/menu.dart';

class BottomFixedButton extends GetView {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuController>(tag: Get.arguments['tag']);
    final menu = controller.menuList[Get.arguments['index']];

    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0))
      ]),
      child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text("최소주문금액 " +
                    Get.arguments['restaurant'].minOrderAmount.toString() +
                    "원"),
              ),
              SizedBox(
                height: kDefaultPadding / 2,
              ),
              OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Text(
                        menu.price.toString() + "원 담기",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          )),
    );
  }
}
