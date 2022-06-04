import 'dart:async';

import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/order.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/controller/web_view.dart';
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
    isMatchRequested = true;
    await requestMatch();
  }

  @override
  onClose() async {
    // TODO: 에러 핸들링
    if (!isMatchCanceled) await cancelMatch();
    _timer.cancel();
    super.onClose();
  }

  final RxInt _waitTime = 300.obs;
  final RxBool _isFindSuccess = false.obs;
  final RxBool _isMatchTimeOut = false.obs;
  final RxBool _isMatchAccepted = false.obs;
  final RxBool _isMatchSuccess = false.obs;
  bool isMatchRequested = false;
  bool isMatchCanceled = false;
  bool isMatchFailed = false;
  int matchId = 0;
  int user_num = 0;

  get waitTime => _waitTime.value;

  set waitTime(value) => _waitTime.value = value;

  get isFindSuccess => _isFindSuccess.value;

  set isFindSuccess(value) => _isFindSuccess.value = value;

  get isMatchTimeOut => _isMatchTimeOut.value;

  set isMatchTimeOut(value) => _isMatchTimeOut.value = value;

  get isMatchAccepted => _isMatchAccepted.value;

  set isMatchAccepted(value) => _isMatchAccepted.value = value;

  get isMatchSuccess => _isMatchSuccess.value;

  set isMatchSuccess(value) => _isMatchSuccess.value = value;

  setTimer() async {
    isMatchTimeOut = false;
    isFindSuccess = false;
    isMatchAccepted = false;
    isMatchSuccess = false;

    if (!isMatchRequested) await requestMatch();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (waitTime > 0) {
        waitTime -= 1;
      } else {
        isMatchTimeOut = true;
        isFindSuccess = false;
        showTimeOutDialog();
        await cancelMatch();
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
    if (isMatchRequested) return;

    String menu_price = (OrderController.to.expectedPrice -
            OrderController.to.orderRestaurant!.minDeliveryTip)
        .toString();
    List<String> item = List<String>.empty(growable: true);

    OrderController.to.orderList.forEach((menu) => item.add(menu.value.name));

    Map<String, dynamic> requestJson = <String, dynamic>{
      // 현재
      'userId': UserController.to.user.userId,
      // 추후 실 테스트
      // 'nickname': UserController.to.user.nickname,
      'address': UserController.to.user.address,
      'restaurant': OrderController.to.orderRestaurant!.name,
      'menu_price': menu_price,
      'delivery_price':
          OrderController.to.orderRestaurant!.minDeliveryTip.toString(),
      'item': item
    };

    final result = await repository.requestMatch(requestJson);

    isMatchCanceled = false;
    isMatchRequested = false;

    if (result['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }

  cancelMatch() async {
    if (isMatchCanceled) return;

    final result =
        await repository.cancelMatch(UserController.to.user.nickname);
    // 추후 실 테스트
    // final result =
    //     await repository.cancelMatch(UserController.to.user.nickname);

    isMatchCanceled = true;

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
      if (select == 2) {
        // TODO: 매칭 수락하더라도 상대방 수락할 때까지 대기 화면 만들기
        isMatchAccepted = true;
      } else {
        // TODO: 이 부분 에러 잡기
        setTimer();
      }
      return true;
    } else {
      return false;
    }
  }

  selectMatchDialog() =>
      DialogController.to.openDialog("매칭을 수락하시겠어요?", "매칭이 성공했어요!", [
        TextButton(
            onPressed: () async {
              await MatchController.to.acceptMatch(2);
              Get.back();
              Get.back();
            },
            child: Text("취소")),
        TextButton(
            onPressed: () async {
              await MatchController.to.acceptMatch(1);
              Get.toNamed("/middle_point");
            },
            child: Text("수락", style: TextStyle(color: Colors.red)))
      ]);
}
