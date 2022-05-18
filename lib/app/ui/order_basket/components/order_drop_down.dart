import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/ui/order_basket/components/order_bottom_sheet.dart';

class OrderDropDown extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
        child: Row(
          children: [
            TextButton(
                onPressed: () {
                  Get.bottomSheet(
                    OrderBottomSheet(),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.black)),
                child: Row(
                  children: [
                    Obx(() => Text(
                          controller.receiveDelivery,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                    Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                )),
            Text("로 받을게요")
          ],
        ));
  }
}
