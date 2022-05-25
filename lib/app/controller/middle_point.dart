import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MiddlePointController extends GetxController {
  WebViewController? webViewController;

  sendLocationToWebView(String address1, String address2) async {
    // WebViewRequest(
    //     uri: Uri.parse('https://middlecal.herokuapp.com/'),
    //     method: WebViewRequestMethod.get,
    //     headers: <String, String>{'Content-Type': 'application/json'},
    //     body: Uint8List.fromList((address1 + " " + address2).codeUnits));
    await webViewController!
        .runJavascriptReturningResult('window.fromFlutter("$address1", "$address2")');
  }
}
