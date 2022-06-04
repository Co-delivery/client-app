import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';
import 'package:codelivery/app/ui/middle_point/components/bottom_order_bill.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/order_bill_list.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class OrderBill extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Text(
              "주문 내역",
              style: TextStyle(color: Colors.black, fontSize: 24),
            )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomShadowCard(
                child: Column(children: [
              for (int i = 0; i < OrderController.to.orderList.length; i++)
                OrderBillList(i: i),
            ])),
          ],
        ),
      ),
      bottomSheet: BottomOrderBill(),
    );
  }
}
