import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:codelivery/app/constant/constant.dart';

import 'package:codelivery/app/controller/sign.dart';

import 'package:codelivery/app/ui/sign/components/rounded_register_button.dart';
import 'package:codelivery/app/ui/sign/components/rounded_input_field.dart';

import 'package:codelivery/app/ui/getting_started/components/row_text_button_with_description.dart';

class SignBody extends GetView<SignController> {
  SignBody({Key? key}) : super(key: key);

  String name = "";
  String nickname = "";

  void openDialog(String title, String content, List<Widget> actions) {
    Get.dialog(foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
        ? CupertinoAlertDialog(
            title: Text(title), content: Text(content), actions: actions)
        : AlertDialog(
            title: Text(title), content: Text(content), actions: actions));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightInputField = 60;
    final heightButton = 64;
    final heightLottie = size.height - (heightInputField * 4 + heightButton);

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: SingleChildScrollView(
                    // scroll disable
                    // physics: const NeverScrollableScrollPhysics(),
                    child: Center(
                        child: Obx(() => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // SizedBox(height: paddingFromTop),
                                controller.isRegister
                                    ? Lottie.asset(
                                        "assets/lotties/register.json",
                                        height: size.width / 2)
                                    : Lottie.asset("assets/lotties/login.json",
                                        height: size.width / 2),
                                RoundedInputField(
                                    maxLength: 20,
                                    hintText: "아이디를 입력하세요",
                                    onChanged: (value) =>
                                        controller.sign.userId = value,
                                    onSubmitted: (value) =>
                                        controller.sign.userId = value),
                                RoundedInputField(
                                    maxLength: 20,
                                    hintText: "비밀번호를 입력하세요",
                                    onChanged: (value) =>
                                        controller.sign.password = value,
                                    onSubmitted: (value) =>
                                        controller.sign.password = value),
                                controller.isRegister
                                    ? RoundedInputField(
                                        maxLength: 20,
                                        hintText: "닉네임을 입력하세요",
                                        onChanged: (value) =>
                                            controller.sign.nickname = value,
                                        onSubmitted: (value) =>
                                            controller.sign.nickname = value)
                                    : Container(),
                                controller.isRegister
                                    ? RoundedInputField(
                                        maxLength: 50,
                                        hintText: "주소를 입력하세요",
                                        onChanged: (value) =>
                                            controller.sign.address = value,
                                        onSubmitted: (value) =>
                                            controller.sign.address = value)
                                    : Container(),
                                RoundedRegisterButton(
                                  onPressed: () async {
                                    if (controller.isRegister == true) {
                                      if (controller.sign.userId != "" &&
                                          controller.sign.password != "" &&
                                          controller.sign.nickname != "" &&
                                          controller.sign.address != "") {
                                        await controller.register();
                                      } else {
                                        openDialog(
                                          '빈 칸이 있어요',
                                          '제대로 입력 했는지 확인해주세요!',
                                          [
                                            TextButton(
                                              child: const Text('취소'),
                                              onPressed: () => Get.back(),
                                            )
                                          ],
                                        );
                                        return;
                                      }
                                    } else {
                                      if (controller.sign.userId != "" &&
                                          controller.sign.password != "") {
                                        await controller.login();
                                      } else {
                                        openDialog(
                                          '빈 칸이 있어요',
                                          '제대로 입력 했는지 확인해주세요!',
                                          [
                                            TextButton(
                                              child: const Text('취소'),
                                              onPressed: () => Get.back(),
                                            )
                                          ],
                                        );
                                        return;
                                      }
                                    }
                                  },
                                  text: '회원가입',
                                ),
                                RowTextButtonWithDescription(
                                    description: !controller.isRegister
                                        ? "계정이 없으신가요?"
                                        : "이미 계정이 있으신가요?",
                                    text:
                                        !controller.isRegister ? "회원가입" : "로그인",
                                    onPressed: () async {
                                      controller.isRegister =
                                          !controller.isRegister;
                                    })
                              ],
                            )))))));
  }
}
