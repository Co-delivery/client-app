import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/ui/sign/components/body.dart';

class SignPage extends StatelessWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SignBody(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => Get.toNamed('/home'),
        // )
    );
  }
}
