import 'package:get/get.dart';

import 'package:codelivery/app/data/repository/register.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find<RegisterController>();

  final RegisterRepository registerRepository;

  RegisterController({required this.registerRepository}) {
    initUser();
  }

  late var _user;
  RxBool _isAlreadyNickname = false.obs;

  get user => this._user.value;

  set user(value) => this._user.value = value;

  get isAlreadyNickname => this._isAlreadyNickname.value;

  set isAlreadyNickname(value) => this._isAlreadyNickname.value = value;

  initUser() => _user = registerRepository.user.obs;
}
