import 'package:get/get.dart';

import 'package:codelivery/app/data/model/user.dart';

class UserController extends GetxController {
  static UserController get to => Get.find<UserController>();

  late Rx<User> _user;

  get user => _user.value;

  set user(value) => _user.value = value;

  initUser(Rx<User> user) => _user = user;
}
