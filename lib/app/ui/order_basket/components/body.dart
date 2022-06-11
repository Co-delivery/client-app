import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/ui/order_basket/components/order_drop_down.dart';
import 'package:codelivery/app/ui/order_basket/components/order_list.dart';
import 'package:codelivery/app/ui/order_basket/components/order_receipt.dart';

import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class OrderBasketBody extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              color: Colors.white,
              width: size.width,
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.orderRestaurant!.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                ],
              )),
          Obx(() => BottomShadowCard(
                  child: Column(children: [
                for (int i = 0; i < controller.orderList.length; i++)
                  OrderList(i: i),
                OrderDropDown()
              ]))),
          BottomShadowCard(child: OrderReceipt())
        ],
      ),
    );
  }
}
