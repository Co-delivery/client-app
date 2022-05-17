import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/restaurant.dart';

class InfoStack extends GetView<RestaurantController> {
  const InfoStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Column(children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      controller
                          .restaurantList[Get.arguments['index']].thumbnail,
                    ),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: Colors.white,
            height: size.height * 0.175,
          ),
        ]),
        Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          height: 150,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.restaurantList[Get.arguments['index']].name,
                  style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: kDefaultPadding / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                        size: 30,
                      ),
                    Text(" "),
                    Text(
                      controller
                          .restaurantList[Get.arguments['index']].starRating
                          .toStringAsFixed(1),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
