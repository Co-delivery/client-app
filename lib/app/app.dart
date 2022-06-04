import 'package:codelivery/app/route/app_routes.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CodeliveryApp extends StatelessWidget {
  CodeliveryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        title: 'Codelivery',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        initialRoute: AppRoutes.routes.first.toString(),
        getPages: AppRoutes.routes);
  }
}
