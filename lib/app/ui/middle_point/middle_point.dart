import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/body.dart';
import 'package:codelivery/app/ui/middle_point/components/floating_action_button.dart';

import '../../controller/middle_point.dart';

class MiddlePointPage extends GetView<MiddlePointController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ElevatedButton(
        child: Text('send to javascript'),
        onPressed: () {
          if (controller.webViewController != null) {
            controller.sendLocationToWebView("hello", "world");
          }
        },
      )),
      body: MiddlePointBody(),
      floatingActionButton: MiddlePointFloatingActionButton(),
    );
  }
}
