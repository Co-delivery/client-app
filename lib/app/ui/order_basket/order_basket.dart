import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/order.dart';

import 'package:codelivery/app/ui/order_basket/components/body.dart';
import 'package:codelivery/app/ui/order_basket/components/bottom_fixed_button.dart';

class OrderBasketPage extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightAppBar = 60.0;
    final heightBottomFixedButton = 60.0;
    final heightCenter = size.height - (heightBottomFixedButton + heightAppBar);

    return Scaffold(
      appBar: AppBar(
          title: Text("장바구니", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
            onPressed: () => Get.back(),
          )),
      body: controller.orderList.isEmpty
          ? Container(
          alignment: Alignment.center,
          height: heightCenter,
          child: Text(
            "주문이 없어요!",
            style: TextStyle(fontSize: 20),
          ))
          : OrderBasketBody(),
      bottomSheet: BottomFixedButton(),
      floatingActionButton: FloatingActionButton(onPressed: () => Get.toNamed('/middle_point'),),
    );
  }
}
