import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:codelivery/app/constant/constant.dart';

class MatchLottie extends StatefulWidget {
  const MatchLottie({Key? key}) : super(key: key);

  @override
  MatchLottieState createState() => MatchLottieState();
}

class MatchLottieState extends State<MatchLottie> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
        child: Container(
            height: double.infinity,
            child: LottieBuilder.asset(
              'assets/lotties/matching.json',
              frameRate: FrameRate.max,
              repeat: true,
              animate: true,
            )));
  }
}
