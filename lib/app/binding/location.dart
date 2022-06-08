import 'package:get/get.dart';

import '../controller/location.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
