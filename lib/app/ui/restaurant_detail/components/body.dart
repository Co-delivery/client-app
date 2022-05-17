import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/controller/restaurant.dart';
import 'package:codelivery/app/ui/restaurant_detail/components/info_stack.dart';
import 'package:codelivery/app/ui/restaurant_detail/components/delivery_info.dart';
import 'package:codelivery/app/ui/restaurant_detail/components/menu_list.dart';

class RestaurantDetailBody extends GetView<RestaurantController> {
  const RestaurantDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [InfoStack(), DeliveryInfo(), MenuList()],
      ),
    );
  }
}
