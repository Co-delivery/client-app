import 'dart:async';

import 'package:codelivery/app/controller/dialog.dart';
import 'package:codelivery/app/controller/match.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/ui/accept_match/accept_match.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

void ToAcceptMatchPage(double mainUserLat, double mainUserLon,
    String otherUserNickname, double otherUserLat, double otherUserLon) {
  Get.to(AcceptMatchPage(), binding: BindingsBuilder(() {
    Get.put(WebController(
        mainUserLat: mainUserLat,
        mainUserLon: mainUserLon,
        otherUserNickname: otherUserNickname,
        otherUserLat: otherUserLat,
        otherUserLon: otherUserLon));
  }), popGesture: false);
}

class WebController extends GetxController {
  static WebController get to => Get.find<WebController>();

  WebViewController? locationWebViewController;
  WebViewController? chatWebViewController;

  WebController(
      {required this.mainUserLat,
      required this.mainUserLon,
      required this.otherUserNickname,
      required this.otherUserLat,
      required this.otherUserLon}) {
    setTimer();
  }

  @override
  onInit() {
    super.onInit();
    MatchController.to.cancelTimer();
  }

  @override
  onClose() async {
    // TODO: 에러 핸들링
    if (!_isMatchTimeOut) _timer.cancel();
    if (!MatchController.to.isMatchAccepted) {
      await MatchController.to.acceptMatch(2);
    }
    super.onClose();
  }

  final RxBool _isMiddlePointLoading = true.obs;
  final RxBool _isChatLoading = true.obs;

  get isMiddlePointLoading => _isMiddlePointLoading.value;

  set isMiddlePointLoading(value) => _isMiddlePointLoading.value = value;

  refreshMiddlePointLoading() => _isMiddlePointLoading.refresh();

  get isChatLoading => _isChatLoading.value;

  set isChatLoading(value) => _isChatLoading.value = value;

  refreshChatLoading() => _isChatLoading.refresh();

  double mainUserLat = 0;
  double mainUserLon = 0;

  String otherUserNickname = "";
  double otherUserLat = 0;
  double otherUserLon = 0;

  late Timer _timer;
  final RxInt _waitTime = 60.obs;

  bool _isMatchTimeOut = false;

  get waitTime => _waitTime.value;

  set waitTime(value) => _waitTime.value = value;

  setTimer() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (waitTime > 0) {
        waitTime -= 1;
      } else {
        _isMatchTimeOut = true;
        _timer.cancel();
        Get.back();
      }
    });
  }

  cancelTimer() => _timer.cancel();

  sendLocationToWebView() async {
    try {
      await locationWebViewController!.runJavascriptReturningResult(
          'window.fromFlutter($mainUserLon, $mainUserLat,  $otherUserLon, $otherUserLat)');
      print("isMiddle ${isMiddlePointLoading}");
      isMiddlePointLoading = false;
      _isMiddlePointLoading.refresh();
    } catch (e) {
      debugPrint("sendLocation ${e.toString()}");
    }
  }

  sendNicknameToWebView() async {
    final roomName =
        UserController.to.user.nickname.compareTo(otherUserNickname) == -1
            ? (UserController.to.user.nickname + " " + otherUserNickname)
            : (otherUserNickname + " " + UserController.to.user.nickname);
    try {
      await chatWebViewController!.runJavascriptReturningResult(
          'window.getMatchResult("${UserController.to.user.nickname}", "$roomName")');
      isChatLoading = false;
      _isChatLoading.refresh();
    } catch (e) {
      debugPrint("sendLocation ${e.toString()}");
    }
  }

  openWarningDialog() =>
      DialogController.to.openDialog("매칭이 취소됩니다.", "매칭을 취소하시겠습니까?", [
        TextButton(
            onPressed: () => Get.back(),
            child: Text(
              "아니오",
            )),
        TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: Text(
              "예",
              style: TextStyle(color: Colors.red),
            ))
      ]);
}
