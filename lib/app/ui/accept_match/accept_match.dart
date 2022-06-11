import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/ui/accept_match/components/body.dart';

import '../../controller/dialog.dart';
import '../../controller/match.dart';
import '../../controller/payment.dart';
import '../../controller/web_view.dart';

class AcceptMatchPage extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(() => Scaffold(
        appBar: MatchController.to.isMatchSuccess
            ? AppBar(
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "매칭 수락까지 남은 시간",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      Obx(() => Text(
                            controller.waitTime.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                    ]),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(60.0),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding,
                            vertical: kDefaultPadding / 2),
                        child: Container(
                          width: size.width * 0.75,
                          child: OutlinedButton(
                              onPressed: () => Get.toNamed('/match/order_bill'),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      kPrimaryLightColor),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white)),
                              child: Text("결제하기")),
                        ))),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
                  onPressed: () => DialogController.to
                      .openDialog("결제를 취소하시겠습니까?", "결제 및 매칭이 모두 취소됩니다.", [
                    TextButton(
                        onPressed: () => Get.back(), child: Text("되돌아가기")),
                    TextButton(
                        onPressed: () async {
                          await PaymentController.to.payForOrder(2);
                          Get.until(
                              (route) => Get.currentRoute == '/order_basket');
                        },
                        child: Text(
                          "결제 취소",
                          style: TextStyle(color: Colors.red),
                        )),
                  ]),
                ),
              )
            : AppBar(
                centerTitle: true,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "매칭 수락까지 남은 시간",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(
                        height: kDefaultPadding / 4,
                      ),
                      Obx(() => Text(
                            controller.waitTime.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                    ]),
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(60.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                          vertical: kDefaultPadding / 2),
                      child: Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () =>
                                      controller.openWarningDialog(),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  child: Text(
                                    "거절",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  ))),
                          SizedBox(
                            width: kDefaultPadding / 2,
                          ),
                          Expanded(
                              child: OutlinedButton(
                                  onPressed: () async =>
                                      await MatchController.to.acceptMatch(1),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                  child: Text(
                                    "수락",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  )))
                        ],
                      ),
                    )),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
                  onPressed: () => controller.openWarningDialog(),
                ),
              ),
        body: AcceptMatchBody()));
  }
}
