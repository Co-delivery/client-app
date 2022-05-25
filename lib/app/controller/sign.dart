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
  bool isRegister = false;
  bool isLogin = false;

  get sign => this._sign.value;

  set sign(value) => this._sign.value = value;

  get isSign => this._isSign.value;

  set isSign(value) => this._isSign.value = value;

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
    if ((await repository.login(data))['httpStatus'] == 200) {
      UserController.to.initUser(User(
              nickname: sign.nickname, address: sign.address, token: sign.token)
          .obs);
      isLogin = true;
    } else {
      isLogin = false;
    }
  }
}
