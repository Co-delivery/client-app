import 'dart:async';

import 'package:codelivery/app/controller/match.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/ui/middle_point/middle_point.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

void ToWebView(double mainUserLat, double mainUserLon, String otherUserNickname,
        double otherUserLat, double otherUserLon) =>
    Get.to(MiddlePointPage(), binding: BindingsBuilder(() {
      Get.put(WebController(
          mainUserLat: mainUserLat,
          mainUserLon: mainUserLon,
          otherUserNickname: otherUserNickname,
          otherUserLat: otherUserLat,
          otherUserLon: otherUserLon));
    }));

class WebController extends GetxController {
  static WebController get to => Get.find<WebController>();

  WebViewController? webViewController;

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
    super.onClose();
  }

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

  sendLocationToWebView() async =>
      await webViewController!.runJavascriptReturningResult(
          'window.fromFlutter($mainUserLat, $mainUserLon, $otherUserLat, $otherUserLon)');

  sendNicknameToWebView() async {
    final roomName =
        UserController.to.user.nickname.compareTo(otherUserNickname) == -1
            ? (UserController.to.user.nickname + " " + otherUserNickname)
            : (otherUserNickname + " " + UserController.to.user.nickname);
    await webViewController!.runJavascript(
        'window.getMatchResult("${UserController.to.user.nickname}", "${roomName}")');
  }
}
