import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:codelivery/app/controller/web_view.dart';

class ChatWebView extends GetView<WebController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Padding(
          padding: const EdgeInsets.only(
              right: kDefaultPadding,
              left: kDefaultPadding,
              top: kDefaultPadding * 3,
              bottom: kDefaultPadding),
          child: WebView(
            initialUrl: 'http://192.168.0.9:3000',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              controller.chatWebViewController = webViewController;
            },
            // onPageStarted: (url) async {
            //   print("started");
            //   await controller.sendNicknameToWebView("dongha", "dongha jin");
            // },
            onProgress: (url) async {
              await controller.sendNicknameToWebView();
            },
            onPageStarted: (url) async {
              await controller.sendNicknameToWebView();
            },
            onPageFinished: (url) async {
              await controller.sendNicknameToWebView();
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
          ))
    ]));
  }
}
