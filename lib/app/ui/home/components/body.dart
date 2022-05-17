import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/restaurant.dart';
import 'package:codelivery/app/ui/home/components/list_item.dart';

class HomeBody extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: ListView.builder(
            itemCount: controller.restaurantList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Text(
                  "우리 동네 맛집 배달",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              } else {
                print(index);
                return RestaurantThumbnailCard(
                    thumbnail: controller.restaurantList[index - 1].thumbnail,
                    name: controller.restaurantList[index - 1].name,
                    starRating: controller.restaurantList[index - 1].starRating,
                    minDeliveryTime:
                        controller.restaurantList[index - 1].minDeliveryTime,
                    maxDeliveryTime:
                        controller.restaurantList[index - 1].maxDeliveryTime,
                    minOrderAmount:
                        controller.restaurantList[index - 1].minOrderAmount,
                    deliveryTip:
                        controller.restaurantList[index - 1].minDeliveryTip,
                    distance: controller.restaurantList[index - 1].distance,
                    onTap: () {
                      controller.toDetailPage(index-1);
                    });
              }
            }));
  }
}
