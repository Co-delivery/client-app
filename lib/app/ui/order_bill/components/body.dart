import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/order.dart';
import 'package:codelivery/app/ui/middle_point/components/bottom_order_bill.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/order_bill_list.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class OrderBillBody extends GetView {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
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
    );
  }
}
