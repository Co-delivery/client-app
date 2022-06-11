import 'package:codelivery/app/controller/match.dart';
import 'package:codelivery/app/data/repository/payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController get to => Get.find<PaymentController>();

  final PaymentRepository repository;

  PaymentController({required this.repository});

  final RxBool _isPay = false.obs;

  get isPay => _isPay.value;

  set isPay(value) => _isPay.value = value;

  payForOrder(int select) async =>
      isPay = await repository.payForOrder(<String, dynamic>{
        'matchId': MatchController.to.matchId,
        'user_num': 1,
        'result': select
      });
}
