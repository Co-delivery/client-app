import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/middle_point/components/body.dart';
import 'package:codelivery/app/ui/middle_point/components/floating_action_button.dart';

import '../../controller/match.dart';
import '../../controller/web_view.dart';

class MiddlePointPage extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(
      () => Scaffold(
          appBar: MatchController.to.isMatchSuccess
              ? AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                )
              : AppBar(
                  centerTitle: true,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "매칭 수락까지 남은 시간\n",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          controller.waitTime.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )
                      ]),
                  bottom: MatchController.to.isMatchAccepted
                      ? PreferredSize(
                          child: Container(), preferredSize: Size.fromHeight(0))
                      : PreferredSize(
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
                                              color: Colors.black,
                                              fontSize: 20),
                                        ))),
                                SizedBox(
                                  width: kDefaultPadding / 2,
                                ),
                                Expanded(
                                    child: OutlinedButton(
                                        onPressed: () async =>
                                            await MatchController.to
                                                .acceptMatch(2),
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
          body: MiddlePointBody(),
          floatingActionButton: MatchController.to.isMatchSuccess
              ? buildFloatingActionButton(context)
              : Container()),
    );
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
              onTap: () => Get.toNamed('/middle_point/chat'),
              child: Icon(Icons.chat_rounded),
              label: '채팅하기'),
          SpeedDialChild(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              labelBackgroundColor: Colors.white,
              labelStyle: TextStyle(color: Colors.black),
              onTap: () => Get.toNamed('/middle_point/bill'),
              child: Icon(Icons.receipt_rounded),
              label: '주문내역')
        ]);
  }
}
