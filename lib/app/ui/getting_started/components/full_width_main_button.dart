import 'package:flutter/material.dart';

import 'package:codelivery/app/constant/constant.dart';

class FullWidthMainButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const FullWidthMainButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
            height: 56.0,
            child: OutlinedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff216FEA)),
                  foregroundColor: MaterialStateProperty.all(
                    const Color(0xffffffff),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ))));
  }
}
