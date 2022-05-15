import 'package:get/get.dart';

import 'package:codelivery/app/controller/sign.dart';
import 'package:codelivery/app/data/provider/sign_api.dart';

import 'package:codelivery/app/data/repository/sign.dart';

class SignBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<SignController>(() =>
        SignController(repository: SignRepository(apiClient: SignApiClient())));
  }
}
