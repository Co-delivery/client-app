import 'package:codelivery/app/controller/fcm.dart';
import 'package:codelivery/app/controller/user.dart';
import 'package:codelivery/app/data/model/user.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/data/repository/sign.dart';

class SignController extends GetxController {
  static SignController get to => Get.find<SignController>();

  final SignRepository repository;

  SignController({required this.repository, isRegister}) {
    _isSign = isRegister;
    initSign();
  }

  late var _sign;
  late RxBool _isSign;
  RxBool _isObscureText = true.obs;
  bool isRegister = false;
  bool isLogin = false;

  get sign => this._sign.value;

  set sign(value) => this._sign.value = value;

  get isSign => this._isSign.value;

  set isSign(value) => this._isSign.value = value;

  get isObscureText => _isObscureText.value;

  set isObscureText(value) => _isObscureText.value = value;

  initSign() => _sign = repository.sign.obs;

  register() async {
    sign.token = FcmController.to.token;
    if ((await repository.register(sign.toJson()))['httpStatus'] == 200) {
      isRegister = true;
    } else {
      isRegister = false;
    }
  }

  login() async {
    Map<String, dynamic> data = {
      'userId': sign.userId,
      'password': sign.password,
      'token': FcmController.to.token,
    };
    final result = await repository.login(data);
    if (result['httpStatus'] == 200) {
      UserController.to.initUser(User(
              userId: sign.userId,
              nickname: result['data']['nickname'],
              address: result['data']['address'],
              token: sign.token)
          .obs);
      isLogin = true;
    } else {
      isLogin = false;
    }
  }

  refreshSignData() {
    isSign = !isSign;
    sign.userId = "";
    sign.nickname = "";
    sign.password = "";
    sign.address = "";
    _sign.refresh();
  }
}
