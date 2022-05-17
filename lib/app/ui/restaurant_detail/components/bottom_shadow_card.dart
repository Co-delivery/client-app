import 'package:flutter/material.dart';

class BottomShadowCard extends StatelessWidget {
  const BottomShadowCard({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 0.25,
              blurRadius: 0.25,
              offset: Offset(0, 2))
        ]),
        child: child);
  }
}
