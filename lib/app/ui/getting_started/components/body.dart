import 'package:codelivery/app/ui/getting_started/components/row_text_button_with_description.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';

import 'package:codelivery/app/controller/getting_started.dart';

import 'package:codelivery/app/ui/getting_started/components/full_width_main_button.dart';
import 'package:codelivery/app/ui/getting_started/components/started_page_view.dart';

class GettingStartedBody extends GetView<GettingStartedController> {
  const GettingStartedBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double heightPadding = kDefaultPadding * 2;
    double heightMainButton = 56;
    double heightRowTextButton = 20;
    double heightStartedPageView = width / 1.5 + 130;
    double paddingSlideDotsFromBtn = (height -
            (heightPadding +
                heightMainButton +
                heightRowTextButton +
                heightStartedPageView)) /
        5;

    return SafeArea(
        child: Stack(children: [
      Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: <Widget>[
            Expanded(child: StartedPageView()),
            SizedBox(height: paddingSlideDotsFromBtn),
            FullWidthMainButton(
              onPressed: () async {
                controller.toSign(true);
                Get.toNamed('sign');
              },
              text: "회원 가입",
            ),
            RowTextButtonWithDescription(
                description: "이미 계정이 있으신가요?",
                text: "로그인",
                onPressed: () async {
                  controller.toSign(false);
                  Get.toNamed('sign');
                })
          ],
        ),
      )
    ]));
  }
}
