import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MiddlePointWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
