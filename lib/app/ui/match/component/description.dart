import 'package:codelivery/app/controller/match.dart';
import 'package:codelivery/app/controller/order.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';

class Description extends GetView<MatchController> {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Obx(() => Text(
            "남은 시간 ${controller.waitTime ~/ 60}분 ${controller.waitTime % 60}초",
            style:
                TextStyle(color: Colors.white, fontSize: kMatchTitleFontSize))),
        Text("주변 사람들과\n매칭 중이에요",
            style:
                TextStyle(color: Colors.white, fontSize: kMatchTitleFontSize)),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("주소  ",
                style: TextStyle(
                    color: Colors.black, fontSize: kMatchOptionFontSize)),
            Flexible(
                child: Text(
              UserController.to.user.address,
              style: TextStyle(
                color: Colors.black,
                fontSize: kMatchSubTitleFontSize,
              ),
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("주문금액  ",
                style: TextStyle(
                    color: Colors.black, fontSize: kMatchOptionFontSize)),
            Text("${OrderController.to.expectedPrice.toString()}원",
                style: TextStyle(
                    color: Colors.black, fontSize: kMatchSubTitleFontSize)),
          ],
        ),
      ],
    );
  }
}
