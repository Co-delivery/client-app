import 'package:get/get.dart';

import 'package:codelivery/app/controller/order.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderController(), permanent: true);
  }
}
