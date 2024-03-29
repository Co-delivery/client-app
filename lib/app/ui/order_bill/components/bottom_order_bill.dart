import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/ui/order_bill/components/bottom_fixed_button.dart';

class BottomOrderBill extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 2),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text("총 주문금액",
                              style: TextStyle(
                                fontSize: 16,
                              ))),
                      Text(
                          (controller.expectedPrice -
                                      controller
                                          .orderRestaurant!.minDeliveryTip)
                                  .toString() +
                              "원",
                          style: TextStyle(
                            fontSize: 16,
                          ))
                    ],
                  )),
              Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text("배달팁",
                              style: TextStyle(
                                fontSize: 16,
                              ))),
                      Text(
                          (controller.orderRestaurant!.minDeliveryTip ~/ 2)
                                  .toString() +
                              "원",
                          style: TextStyle(
                            fontSize: 16,
                          ))
                    ],
                  )),
              const Padding(
                  padding: EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Divider()),
              Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding / 2),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text("결제예정금액",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                      Text(controller.expectedPrice.toString() + "원",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))
                    ],
                  )),
              BottomFixedButton()
            ],
          ),
        ));
  }
}
