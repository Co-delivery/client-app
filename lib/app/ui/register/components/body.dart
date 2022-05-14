import 'package:codelivery/app/ui/register/components/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' as foundation;

import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import 'package:codelivery/app/constant/constant.dart';

import 'package:codelivery/app/controller/register.dart';

import 'package:codelivery/app/ui/register/components/rounded_check_duplicate_button.dart';
import 'package:codelivery/app/ui/register/components/rounded_register_button.dart';

class RegisterBody extends GetView<RegisterController> {
  RegisterBody({Key? key}) : super(key: key);

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
    final size = MediaQuery
        .of(context)
        .size;
    final heightLottie = size.width - kDefaultPadding * 2;
    final heightInputField = 50;
    final heightDropDown = 40;
    final heightButton = 64;
    final paddingFromTop = (size.height -
        (heightLottie + heightInputField + heightDropDown + heightButton)) /
        4;

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: paddingFromTop),
                        Lottie.asset("assets/lotties/register.json"),
                        RoundedCheckDuplicateButton(
                            maxLength: 10,
                            hintText: "닉네임을 입력하세요",
                            onChanged: (value) =>
                            controller.user.nickname = value,
                            onSubmitted: (value) =>
                            controller.user.nickname = value,
                            onPressed: () {
                              if (controller.user.nickname.length < 2) {
                                openDialog('너무 짧은 닉네임', '닉네임은 2글자 이상이어야 합니다.', [
                                  TextButton(
                                    child: const Text('취소'),
                                    onPressed: () => Get.back(),
                                  )
                                ]);
                                return;
                              }

                              if (!controller.isAlreadyNickname) {
                                openDialog(
                                  '중복되는 닉네임',
                                  '이미 존재하는 닉네임입니다.',
                                  [
                                    TextButton(
                                      child: const Text('취소'),
                                      onPressed: () => Get.back(),
                                    )
                                  ],
                                );
                                return;
                              }
                              //
                              // controller.alreadyNickname();
                            }),
                        RoundedInputField(maxLength: 20,
                            hintText: "비밀번호를 입력하세요",
                            onChanged: (value) {},
                            onSubmitted: (value) {}),
                        RoundedInputField(maxLength: 20,
                            hintText: "주소를 입력하세요",
                            onChanged: (value) {},
                            onSubmitted: (value) {}),
                        RoundedRegisterButton(
                          onPressed: () {
                            Get.toNamed('/home');
                          },
                          text: '회원가입',
                        ),
                      ],
                    )))));
  }
}
