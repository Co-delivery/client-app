import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class MiddlePointFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {
      showModalBottomSheet(context: context, builder: (context) => WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
      ));
    });
  }
}
