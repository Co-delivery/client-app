import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:codelivery/app/constant/constant.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // total height = width / 1.5 + kDefaultPadding * 3 + 34 + 24
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width / 1.5,
                height: width / 1.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Lottie.asset(slideList[index].imageUrl)),
            const SizedBox(height: kDefaultPadding * 2),
            Text(slideList[index].title,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff216FEA),
                )),
            const SizedBox(height: kDefaultPadding),
            Text(
              slideList[index].descrption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String descrption;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.descrption,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/lotties/1.json',
      title: '저렴한 배달비',
      descrption: '동네 사람과 공동 배달로\n배달비를 줄여보세요!'),
  Slide(
      imageUrl: 'assets/lotties/2.json',
      title: '매칭 & 채팅',
      descrption: '같이 배달 받을 주변 사람을 찾아보고,\n함께 대화도 나눠보세요!'),
  Slide(
      imageUrl: 'assets/lotties/3.json',
      title: '중간 지점 안내',
      descrption: '배달 음식을 전달 받을\n중간 지점도 안내해드릴게요!'),
];
