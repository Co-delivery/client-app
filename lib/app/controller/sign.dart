import 'package:codelivery/app/controller/fcm.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/data/repository/sign.dart';

class SignController extends GetxController {
  static SignController get to => Get.find<SignController>();

  final SignRepository repository;

  SignController({required this.repository, isRegister}) {
    _isRegister = isRegister;
    initSign();
  }

  late var _sign;
  late RxBool _isRegister;

  get sign => this._sign.value;

  set sign(value) => this._sign.value = value;

  get isRegister => this._isRegister.value;

  set isRegister(value) => this._isRegister.value = value;

  initSign() => _sign = repository.sign.obs;

  register() async {
    sign.token = FcmController.to.token;
    await repository.register(sign.toJson());
  }

  login() async {
    Map<String, dynamic> data = {
      'userId': sign.userId,
      'password': sign.password,
      'token': FcmController.to.token,
    };
    await repository.login(data);
  }
}
