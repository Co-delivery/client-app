import 'package:get/get.dart';

import 'package:codelivery/app/controller/dialog.dart';

class DialogBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<DialogController>(DialogController(), permanent: true);
  }
}
