import 'package:flutter/material.dart';

import 'package:codelivery/app/ui/middle_point/components/body.dart';
import 'package:codelivery/app/ui/middle_point/components/floating_action_button.dart';

class MiddlePointPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MiddlePointBody(),
      floatingActionButton: MiddlePointFloatingActionButton(),
    );
  }
}
