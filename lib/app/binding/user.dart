import 'package:codelivery/app/data/repository/user.dart';
import 'package:get/get.dart';

import 'package:codelivery/app/controller/user.dart';

import 'package:codelivery/app/data/provider/user_api.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
        UserController(repository: UserRepository(apiClient: UserApiClient())),
        permanent: true);
  }
}
