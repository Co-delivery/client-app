import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'http_api.dart';

class UserApiClient {
  static final UserApiClient _instance = UserApiClient._internal();
  late final HttpApiClient httpApiClient;

  factory UserApiClient() => _instance;

  UserApiClient._internal() {
    httpApiClient = HttpApiClient();
    print("RegisterApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> updateAddress(Map<String, String> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/user/signup",
          data,
          headers);
}
