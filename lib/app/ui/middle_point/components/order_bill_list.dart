import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/widgets/bottom_shadow_card.dart';
import 'package:codelivery/app/widgets/adjust_amount_button.dart';

class OrderBillList extends GetView<OrderController> {
  const OrderBillList({Key? key, required this.i}) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                controller.orderList[i].value.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    controller.orderList[i].value.price.toString() + "원",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )),
                  Text(
                    controller.orderList[i].value.amount.toString() + "개",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            ],
          )),
      Divider(),
    ]);
  }
}
