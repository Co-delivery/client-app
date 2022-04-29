import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/fcm_controller.dart';
import 'package:codelivery/app/ui/middle_point/middle_point.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final FcmController fcmController = Get.put(FcmController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: fcmController.initialize(), // 여기서 앱 실행 전에 해야 하는 초기화 진행
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Obx(() => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(fcmController.message.value?.notification?.title ?? 'title', style: TextStyle(fontSize: 20)),
                      Text(fcmController.message.value?.notification?.body ?? 'message', style: TextStyle(fontSize: 15)),
                      OutlinedButton(onPressed: () {
                        fcmController.sendMessage(email: "test", title: "title", body: "body");
                        // appController.sendMessage(userToken: dotenv.env["FCM_TEST_USER_TOKEN"] ?? "", title: "title", body: "body");
                        // Get.to(() => MatchPage());
                        Get.to(() => MiddlePointPage());
                      }, child: Text("push notification")),
                    ],
                  )));
            } else if (snapshot.hasError) {
              return Center(child: Text('failed to initialize'));
            } else {
              return Center(child: Text('initializing...'));
            }
          },
        ),
      );
  }
}