import 'package:get/get.dart';

import 'package:codelivery/app/controller/register.dart';
import 'package:codelivery/app/data/provider/register_api.dart';

import 'package:codelivery/app/data/repository/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<RegisterController>(() => RegisterController(
        registerRepository: RegisterRepository(apiClient: RegisterApiClient())));
  }
}
