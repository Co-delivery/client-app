import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:codelivery/app/controller/middle_point.dart';

class MiddlePointFloatingActionButton extends GetView<MiddlePointController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FloatingActionButton(onPressed: () {
      showModalBottomSheet(
          context: context,
          builder: (context) => Container(
              height: size.height,
              child: WebView(
                initialUrl: 'https://middlecal.herokuapp.com/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  controller.webViewController = webViewController;
                  // controller.sendLocationToWebView("경기도 화성시 동탄지성로 295", "경기도 수원시 권선구 서수원로 607");
                },
                onProgress: (url) async {
                  await controller.sendLocationToWebView(
                      "경기도 수원시 영통구 중부대로271번길 27-9", "경기도 수원시 영통구 월드컵로 206");
                },
                onPageStarted: (url) async {
                  await controller.sendLocationToWebView(
                      "경기도 수원시 영통구 중부대로271번길 27-9", "경기도 수원시 영통구 월드컵로 206");
                },
                javascriptChannels: Set.from([
                  JavascriptChannel(
                      name: 'JavaScriptChannel',
                      onMessageReceived: (JavascriptMessage message) {
                        print(message.message);
                      })
                ]),
              )));
    });
  }
}
