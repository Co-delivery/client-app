import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:codelivery/app/data/provider/http_api.dart';

class PaymentApiClient {
  static final PaymentApiClient _instance = PaymentApiClient._internal();
  late final HttpApiClient httpApiClient;

  factory PaymentApiClient () => _instance;

  PaymentApiClient._internal() {
    httpApiClient = HttpApiClient();
    print("RegisterApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> payForOrder(Map<String, dynamic> data) async =>
      await httpApiClient.delete(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/match/cancel",
          data,
          headers);
}