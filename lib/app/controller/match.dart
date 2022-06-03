import 'dart:async';

import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/order.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/data/repository/match.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchController extends GetxController {
  static MatchController get to => Get.find<MatchController>();

  final MatchRepository repository;

  late Timer _timer;

  MatchController({required this.repository}) {
    setTimer();
  }

  @override
  onReady() async {
    super.onReady();
    // TODO: 에러 핸들링
    await requestMatch();
  }

  @override
  onClose() async {
    // TODO: 에러 핸들링
    await cancelMatch();
    _timer.cancel();
    super.onClose();
  }

  final RxInt _waitTime = 12.obs;
  final RxBool _isMatchSuccess = false.obs;
  final RxBool _isMatchTimeOut = false.obs;
  int matchId = 0;
  int user_num = 0;

  get waitTime => _waitTime.value;

  set waitTime(value) => _waitTime.value = value;

  get isMatchSuccess => _isMatchSuccess.value;

  set isMatchSuccess(value) => _isMatchSuccess.value = value;

  get isMatchTimeOut => _isMatchTimeOut.value;

  set isMatchTimeOut(value) => _isMatchTimeOut.value = value;

  setTimer() {
    isMatchTimeOut = false;
    isMatchSuccess = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (waitTime > 0) {
        waitTime -= 1;
      } else {
        isMatchTimeOut = true;
        isMatchSuccess = false;
        showTimeOutDialog();
        _timer.cancel();
      }
    });
  }

  cancelTimer() => _timer.cancel();

  showTimeOutDialog() {
    DialogController.to
        .openDialog("매칭을 할 수가 없어요 😭", "주변 동네에 공동 배달을 주문한 사람이 없습니다.", [
      TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          },
          child: Text("취소")),
      TextButton(
          onPressed: () {
            waitTime = 300;
            setTimer();
            Get.back();
          },
          child: Text(
            "재시도",
            style: TextStyle(color: Colors.red),
          ))
    ]);
  }

  requestMatch() async {
    String menu_price = (OrderController.to.expectedPrice -
            OrderController.to.orderRestaurant!.minDeliveryTip)
        .toString();
    List<String> item = List<String>.empty(growable: true);

    OrderController.to.orderList.forEach((menu) => item.add(menu.name));

    Map<String, dynamic> requestJson = <String, dynamic>{
      'nickname': UserController.to.user.nickname,
      'address': UserController.to.user.address,
      'restaurant': OrderController.to.orderRestaurant!.name,
      'menu_price': menu_price,
      'delivery_price':
          OrderController.to.orderRestaurant!.minDeliveryTip.toString(),
      'item': item
    };

    final result = await repository.requestMatch(requestJson);

    if (result['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  cancelMatch() async {
    final result =
        await repository.cancelMatch(UserController.to.user.nickname);

    if (result['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  acceptMatch(int select) async {
    Map<String, dynamic> requestJson = <String, dynamic>{
      'matchId': matchId,
      'user_num': user_num,
      'result': select
    };

    final result = await repository.acceptMatch(requestJson);

    if (result['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }
}
