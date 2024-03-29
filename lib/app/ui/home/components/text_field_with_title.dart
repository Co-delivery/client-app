import 'package:flutter/material.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/ui/home/components/text_field_container.dart';

class TextFieldWithTitle extends StatelessWidget {
  TextFieldWithTitle({required this.title, required this.child});

  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              TextFieldContainer(child: child),
            ]));
  }
}
