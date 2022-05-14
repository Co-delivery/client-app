import 'package:flutter/material.dart';

import 'package:codelivery/app/ui/getting_started/components/body.dart';

class GettingStartedPage extends StatelessWidget {
  GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GettingStartedBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //         // MaterialPageRoute(builder: (context) => HomePage(title: "")));
      //         MaterialPageRoute(builder: (context) => RegisterPage()));
      //   },
      // ),
    );
  }
}