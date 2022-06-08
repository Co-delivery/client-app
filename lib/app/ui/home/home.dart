import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/location.dart';
import 'package:codelivery/app/ui/home/components/text_field_with_title.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/ui/home/components/body.dart';

class HomePage extends GetView {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () => Get.bottomSheet(
                Padding(
                    padding: const EdgeInsets.only(
                        top: kDefaultPadding * 4,
                        bottom: kDefaultPadding,
                        left: kDefaultPadding,
                        right: kDefaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Center(
                            child: Text(
                          "주소 설정",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                        TextFieldWithTitle(
                            title: const Text("새 주소"),
                            child: TextField(
                              controller: LocationController
                                  .to.newLocationEditingController,
                              decoration: const InputDecoration(
                                  hintText: "새 주소를 입력해주세요",
                                  border: InputBorder.none),
                            )),
                        Expanded(
                            child: TextFieldWithTitle(
                                title: const Text("현재 주소"),
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      hintText: UserController.to.user.address,
                                      border: InputBorder.none),
                                ))),
                        OutlinedButton(
                            onPressed: () async {
                              bool isUpdateSuccess = await UserController.to
                                  .updateAddress(LocationController
                                      .to.newLocationEditingController.text);

                              if (isUpdateSuccess) {
                                Get.back();
                              } else {
                                DialogController.to.openDialog(
                                    "주소 설정에 실패했어요.", "다시 시도해주세요.", [
                                  TextButton(
                                      onPressed: () => Get.back(),
                                      child: Text("확인"))
                                ]);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: const Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPadding / 2),
                                child: Text(
                                  "주소 변경",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ))),
                        SizedBox(
                          height: kDefaultPadding,
                        )
                      ],
                    )),
                backgroundColor: Colors.white,
                isScrollControlled: true),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() => Text(
                      UserController.to.user.address,
                      style: TextStyle(fontSize: 16),
                    )),
                const Icon(Icons.keyboard_arrow_down_rounded)
              ],
            )),
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
