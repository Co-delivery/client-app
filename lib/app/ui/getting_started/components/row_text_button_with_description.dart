import 'package:flutter/material.dart';

class RowTextButtonWithDescription extends StatelessWidget {
  final String description;
  final String text;
  final Function() onPressed;

  const RowTextButtonWithDescription(
      {Key? key,
      required this.description,
      required this.text,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(description),
        TextButton(onPressed: onPressed, child: Text(text))
      ],
    );
  }
}
