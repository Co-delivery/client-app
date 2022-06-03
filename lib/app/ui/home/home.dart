import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/ui/home/components/body.dart';

class HomePage extends GetView {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "화성시 동탄지성로 295",
          style: TextStyle(fontSize: 16),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(50, 50),
          child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Container(
                  color: Colors.white,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search), //검색 아이콘 추가
                    ),
                  ))),
        ),
      ),
      // backgroundColor: kScaffoldWithCardBackgroundColor,
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Get.toNamed('/order_basket'),
        child: Icon(
          Icons.shopping_basket_rounded,
          color: Colors.blue,
          size: 33,
        ),
      ),
    );
  }
}
