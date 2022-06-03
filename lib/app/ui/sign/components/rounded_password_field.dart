import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:codelivery/app/constant/constant.dart';
import 'package:codelivery/app/controller/sign.dart';
import 'package:codelivery/app/ui/sign/components/text_field_container.dart';

class RoundedPasswordField extends GetView<SignController> {
  const RoundedPasswordField(
      {Key? key, required this.onChanged, required this.onSubmitted})
      : super(key: key);

  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: Obx(() => TextField(
              obscureText: controller.isObscureText,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                  hintText: "비밀번호를 입력해주세요",
                  icon: Icon(Icons.lock, color: Colors.black),
                  suffixIcon: IconButton(
                    onPressed: () =>
                        controller.isObscureText = !controller.isObscureText,
                    icon: Icon(
                      controller.isObscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  border: InputBorder.none),
            )));
  }
}
