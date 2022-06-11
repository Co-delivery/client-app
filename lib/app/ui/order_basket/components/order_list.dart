import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/widgets/bottom_shadow_card.dart';
import 'package:codelivery/app/widgets/adjust_amount_button.dart';

class OrderList extends GetView<OrderController> {
  const OrderList({Key? key, required this.i}) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [
                Expanded(
                    child: Text(
                  controller.orderList[i].value.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                IconButton(
                    onPressed: () => controller.deleteMenu(i),
                    icon: Icon(Icons.clear_outlined))
              ]),
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
                  Obx(() => AdjustAmountButton(
                        width: size.width * 0.35,
                        radius: 16,
                        amount: controller.orderList[i].value.amount,
                        enableSubMenuAmount:
                            controller.enableSubMenuAmountList[i],
                        enableAddMenuAmount:
                            controller.enableAddMenuAmountList[i],
                        addOnPressed: () => controller.addMenuAmount(i),
                        subOnPressed: () => controller.subMenuAmount(i),
                      ))
                ],
              )
            ],
          )),
      Divider(),
    ]);
  }
}
