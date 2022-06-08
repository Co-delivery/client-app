import 'package:codelivery/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:codelivery/app/controller/web_view.dart';

class MiddlePointWebView extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      WebView(
        initialUrl: 'https://middlecal.herokuapp.com/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          controller.isMiddlePointLoading = true;
          controller.webViewController = webViewController;
          // controller.sendLocationToWebView("경기도 화성시 동탄지성로 295", "경기도 수원시 권선구 서수원로 607");
        },
        onPageStarted: (url) async {
          controller.isMiddlePointLoading = true;
          await controller.sendLocationToWebView();
        },
        onProgress: (url) async {
          await controller.sendLocationToWebView();
        },
        onPageFinished: (url) {
          controller.isMiddlePointLoading = false;
          controller.refreshMiddlePointLoading();
          print("Page finished ${controller.isMiddlePointLoading}");
        },
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'JavaScriptChannel',
              onMessageReceived: (JavascriptMessage message) {
                //This is where you receive message from
                //javascript code and handle in Flutter/Dart
                //like here, the message is just being printed
                //in Run/LogCat window of android studio
                print(message.message);
              })
        ]),
      )
    ]);
  }
}
