import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:codelivery/app/controller/web_view.dart';

class MiddlePointFloatingActionButton extends GetView<WebController> {
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
                  await controller.sendLocationToWebView();
                },
                onPageStarted: (url) async {
                  await controller.sendLocationToWebView();
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
