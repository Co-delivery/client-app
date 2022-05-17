import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/restaurant.dart';
import 'package:codelivery/app/widgets/bottom_shadow_card.dart';

class DeliveryInfo extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    return BottomShadowCard(
        child: Column(
      children: [
        Text(
          "배달주문",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Row(
              children: [
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "최소주문금액",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: kDefaultPadding / 2),
                    Text("결제방법",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    SizedBox(height: kDefaultPadding / 2),
                    Text("배달시간",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        )),
                    SizedBox(height: kDefaultPadding / 2),
                    Text("배달팁",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ))
                  ],
                ),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        controller.restaurantList[Get.arguments['index']]
                                .minOrderAmount
                                .toString() +
                            "원",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    SizedBox(height: kDefaultPadding / 2),
                    Text("바로 결제, 만나서 결제",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                        controller.restaurantList[Get.arguments['index']]
                                .minDeliveryTime
                                .toString() +
                            "~" +
                            controller.restaurantList[Get.arguments['index']]
                                .maxDeliveryTime
                                .toString() +
                            "분 소요 예상",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )),
                    SizedBox(height: kDefaultPadding / 2),
                    Text(
                        controller.restaurantList[Get.arguments['index']]
                                .minDeliveryTip
                                .toString() +
                            "원 ~ " +
                            controller.restaurantList[Get.arguments['index']]
                                .maxDeliveryTip
                                .toString() +
                            "원",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ))
                  ],
                ))
              ],
            ))
      ],
    ));
  }
}
