import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/ui/restaurant_detail/components/body.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: const RestaurantDetailBody(),
      floatingActionButton:
          FloatingActionButton(onPressed: () => Get.toNamed('/order_basket')),
    );
  }
}
