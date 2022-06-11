import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/accept_match/components/middle_point_web_view.dart';

import '../../../controller/web_view.dart';

class AcceptMatchBody extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(children: [
      MiddlePointWebView(),
      WebController.to.isMiddlePointLoading
          ? Center(child: CircularProgressIndicator())
          : Container()
    ]));
  }
}
