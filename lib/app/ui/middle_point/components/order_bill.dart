import 'package:codelivery/app/ui/middle_point/components/bottom_order_bill.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/order_bill_list.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class OrderBill extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BottomShadowCard(
                child: Column(children: [
              for (int i = 0; i < controller.orderList.length; i++)
                OrderBillList(i: i),
            ])),
          ],
        ),
      ),
      bottomSheet: BottomOrderBill(),
    );
  }
}
