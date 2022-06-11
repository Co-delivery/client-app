import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/payment.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';

import 'package:codelivery/app/ui/order_bill/components/body.dart';
import 'package:codelivery/app/ui/order_bill/components/bottom_order_bill.dart';

class OrderBillPage extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
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
      body: OrderBillBody(),
      bottomSheet: BottomOrderBill(),
    );
  }
}
