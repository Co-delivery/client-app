import 'package:codelivery/app/controller/dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/payment.dart';

class BottomFixedButton extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedButton(
            onPressed: () =>
                DialogController.to.openDialog("결제하시겠어요?", "확인 부탁드립니다.", [
                  TextButton(onPressed: () => Get.back(), child: Text("취소")),
                  TextButton(
                      onPressed: () async {
                        await controller.payForOrder(1);
                        Get.back();
                      },
                      child: Text(
                        "확인",
                        style: TextStyle(color: Colors.red),
                      ))
                ]),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: Text("결제하기", style: TextStyle(fontSize: 20)),
            ))
      ],
    );
  }
}
