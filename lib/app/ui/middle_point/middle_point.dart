import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/body.dart';

import '../../controller/match.dart';
import '../../controller/web_view.dart';
import 'components/middle_point_web_view.dart';

class MiddlePointPage extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: MiddlePointBody(),
        floatingActionButton: buildFloatingActionButton(context));
  }

  Widget buildFloatingActionButton(BuildContext context) {
    return SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              labelBackgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.black),
              onTap: () => Get.toNamed('/match/middle_point/chat'),
              child: Icon(Icons.chat_rounded),
              label: '채팅하기'),
          SpeedDialChild(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              labelBackgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.black),
              onTap: () => Get.toNamed('/match/middle_point/bill'),
              child: Icon(Icons.receipt_rounded),
              label: '주문내역')
        ]);
  }
}
