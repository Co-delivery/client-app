import 'package:codelivery/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:codelivery/app/controller/web_view.dart';

class ChatWebView extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        controller.webViewController = webViewController;
        // controller.sendLocationToWebView("경기도 화성시 동탄지성로 295", "경기도 수원시 권선구 서수원로 607");
      },
      // onPageStarted: (url) async {
      //   print("started");
      //   await controller.sendNicknameToWebView("dongha", "dongha jin");
      // },
      onProgress: (url) async {
        await controller.sendLocationToWebView();
      },
      onPageStarted: (url) async {
        await controller.sendLocationToWebView();
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
    );
  }
}
