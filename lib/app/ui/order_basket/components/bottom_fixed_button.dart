import 'package:codelivery/app/controller/order.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';

class BottomFixedButton extends GetView {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0))
      ]),
      child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton(
                  onPressed: () {
                    bool isRequestAvailable =
                    OrderController.to.orderList.length == 0 ? false : true;
                    if (isRequestAvailable) {
                      OrderController.to.requestOrder();
                      Get.toNamed('/middle_point');
                    } else {
                      OrderController.to.openDialog("요청 불가", "주문이 없어요!", [
                        TextButton(
                            onPressed: () => Get.back(), child: Text("확인"))
                      ]);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Text(
                        "결제하기",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          )),
    );
  }
}
