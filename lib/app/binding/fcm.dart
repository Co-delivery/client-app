import 'package:get/get.dart';

import 'package:codelivery/app/controller/fcm.dart';

class FcmBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<FcmController>(FcmController(), permanent: true);
    await FcmController.to.initialize();
  }
}