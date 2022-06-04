import 'package:flutter/material.dart';

import 'package:codelivery/app/ui/middle_point/components/middle_point_web_view.dart';

class MiddlePointBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [MiddlePointWebView()],
    );
  }
}
