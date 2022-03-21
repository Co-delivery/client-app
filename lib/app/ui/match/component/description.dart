import 'package:flutter/material.dart';

import 'package:codelivery/app/constant/constant.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Text("최대 N분\n주변 사람들과\n매칭 중이에요",
            style:
                TextStyle(color: Colors.black, fontSize: kMatchTitleFontSize)),
        const SizedBox(
          height: kDefaultPadding,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("주소  ",
                style: TextStyle(
                    color: Colors.black38, fontSize: kMatchOptionFontSize)),
            Text("경기도 수원시 영통구 월드컵로 206",
                style: TextStyle(
                    color: Colors.black38, fontSize: kMatchSubTitleFontSize)),
          ],
        ),
        const SizedBox(height: kDefaultPadding / 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("카테고리  ",
                style: TextStyle(
                    color: Colors.black45, fontSize: kMatchOptionFontSize)),
            Text("피자 | 치킨 | 햄버거",
                style: TextStyle(
                    color: Colors.black45, fontSize: kMatchSubTitleFontSize)),
          ],
        ),
      ],
    );
  }
}
