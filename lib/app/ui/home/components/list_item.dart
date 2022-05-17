import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

class RestaurantThumbnailCard extends StatelessWidget {
  const RestaurantThumbnailCard({
    Key? key,
    required this.thumbnail,
    required this.name,
    required this.starRating,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.minOrderAmount,
    required this.deliveryTip,
    required this.distance,
    required this.onTap,
  }) : super(key: key);

  final String thumbnail;
  final String name;
  final double starRating;
  final int minDeliveryTime;
  final int maxDeliveryTime;
  final int minOrderAmount;
  final int deliveryTip;
  final double distance;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 3,
          child: SizedBox(
            height: 225,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              thumbnail,
                            ),
                            fit: BoxFit.cover)),
                  )),
                  Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(" "),
                            Icon(Icons.star_rounded, color: Colors.yellow, size: 18,),
                            Expanded(
                                child: Text(
                              starRating.toStringAsFixed(1),
                              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                            )),
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(16.0))),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kDefaultPadding / 4,
                                        horizontal: kDefaultPadding / 2),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 16,
                                        ),
                                        Text(
                                          " " +
                                              minDeliveryTime.toString() +
                                              "~" +
                                              maxDeliveryTime.toString() +
                                              "분",
                                          style: TextStyle(fontSize: 13),
                                        )
                                      ],
                                    )))
                          ],
                        ),
                        SizedBox(height: kDefaultPadding / 2),
                        Row(
                          children: [
                            Text(
                              "최소주문 ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(minOrderAmount.toString() + "원"),
                            Text(" · 배달팁 ",
                                style: TextStyle(color: Colors.grey)),
                            Text("0원~" + deliveryTip.toString() + "원"),
                            Text(" · " + distance.toStringAsFixed(1) + "km")
                          ],
                        )
                      ])),
                ]),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
