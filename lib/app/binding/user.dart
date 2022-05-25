import 'package:get/get.dart';

import 'package:codelivery/app/controller/user.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController(), permanent: true);
  }
}
