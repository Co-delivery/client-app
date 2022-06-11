import 'package:get/get.dart';

import 'package:codelivery/app/controller/payment.dart';
import 'package:codelivery/app/data/provider/payment_api.dart';
import 'package:codelivery/app/data/repository/payment.dart';

class PaymentBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<PaymentController>(
        PaymentController(
            repository: PaymentRepository(apiClient: PaymentApiClient())),
        permanent: true);
  }
}
