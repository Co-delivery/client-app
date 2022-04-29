import 'package:codelivery/app/route/app_routes.dart';
import 'package:codelivery/app/ui/home/home.dart';
import 'package:codelivery/app/ui/match/match.dart';
import 'package:codelivery/app/ui/middle_point/middle_point.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/fcm_controller.dart';

class CodeliveryApp extends StatelessWidget {
  CodeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Codelivery',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: AppRoutes.routes.first.toString(),
      getPages: AppRoutes.routes
    );
  }
}