import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/middle_point_web_view.dart';

import '../../../controller/web_view.dart';

class MiddlePointBody extends GetView {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Stack(
      children: [
        MiddlePointWebView(),
        Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: IconButton(
              icon: Icon(Icons.arrow_back_outlined,
                  color: Colors.black, size: 44),
              onPressed: () => Get.back(),
            )),
        WebController.to.isMiddlePointLoading
            ? Center(child: CircularProgressIndicator())
            : Container()
      ],
    ));
  }
}
