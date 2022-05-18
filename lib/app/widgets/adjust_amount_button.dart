import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';

class AdjustAmountButton extends StatelessWidget {
  AdjustAmountButton({
    required this.width,
    required this.radius,
    required this.amount,
    required this.subOnPressed,
    required this.addOnPressed,
    required this.enableSubMenuAmount,
    required this.enableAddMenuAmount,
  });

  final double width;
  final double radius;
  final int amount;
  final Function() subOnPressed;
  final Function() addOnPressed;
  final bool enableSubMenuAmount;
  final bool enableAddMenuAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: subOnPressed,
                icon: Icon(
                  Icons.remove_rounded,
                  color: enableSubMenuAmount ? Colors.black : kDisableColor,
                )),
            Text(
              amount.toString() + "개",
              style: TextStyle(fontSize: 15),
            ),
            IconButton(
                onPressed: addOnPressed,
                icon: Icon(
                  Icons.add_rounded,
                  color: enableAddMenuAmount ? Colors.black : kDisableColor,
                )),
          ],
        ));
  }
}
