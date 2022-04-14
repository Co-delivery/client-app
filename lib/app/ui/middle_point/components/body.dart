import 'package:flutter/material.dart';

import 'package:codelivery/app/ui/middle_point/components/web_view.dart';

class MiddlePointBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [MiddlePointWebView()],
    ));
  }
}
