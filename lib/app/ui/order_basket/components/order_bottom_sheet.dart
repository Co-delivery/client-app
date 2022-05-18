import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';

class OrderBottomSheet extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("수령방법")),
            for (int i = 0; i < controller.receiveDeliveryList.length; i++)
              Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.selectReceiveDelivery(i);
                          Get.back();
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: Text(
                          controller.receiveDeliveryList[i],
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
                Divider(),
              ]),
            TextButton(
              onPressed: () => Get.back(),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
              child: const Text('확인',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ));
  }
}
