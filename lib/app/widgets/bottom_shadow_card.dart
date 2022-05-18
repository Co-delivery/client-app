import 'package:codelivery/app/constant/constant.dart';
import 'package:flutter/material.dart';

class BottomShadowCard extends StatelessWidget {
  BottomShadowCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: kDefaultPadding), child: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0.25,
              blurRadius: 0.25,
              offset: Offset(0, 2))
        ]),
        child: child));
  }
}
