import 'package:codelivery/app/data/provider/payment_api.dart';

class PaymentRepository {
  final PaymentApiClient apiClient;

  PaymentRepository({required this.apiClient});

  Future<bool> payForOrder(Map<String, dynamic> data) async {
    final result = await apiClient.payForOrder(data);

    if (result['statusCode'] == 200) {
      return true;
    } else {
      return false;
    }
  }
}
