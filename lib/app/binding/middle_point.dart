import 'package:codelivery/app/controller/middle_point.dart';
import 'package:get/get.dart';

class MiddlePointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MiddlePointController());
  }
}
