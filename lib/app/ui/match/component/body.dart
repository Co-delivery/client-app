import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/ui/match/component/description.dart';
import 'package:codelivery/app/ui/match/component/match_lottie.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultPadding * 1.25, horizontal: kDefaultPadding),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              top: 0.0,
              right: 0.0,
              child: GestureDetector(
                  onTap: () {
                    print("hello");
                    Get.back();
                  },
                  child: Text("매칭취소",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: kMatchSubTitleFontSize))),
            ),
            MatchLottie(),
            Description()
          ],
        ));
  }
}
