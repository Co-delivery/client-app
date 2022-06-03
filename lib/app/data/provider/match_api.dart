import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:codelivery/app/data/provider/http_api.dart';

class MatchApiClient {
  static final MatchApiClient _instance = MatchApiClient._internal();
  late final HttpApiClient httpApiClient;

  factory MatchApiClient() => _instance;

  MatchApiClient._internal() {
    httpApiClient = HttpApiClient();
    print("RegisterApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> requestMatch(Map<String, dynamic> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/match/requst",
          data,
          headers);

  Future<Map<String, dynamic>> cancelMatch(Map<String, dynamic> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/match/cancel",
          data,
          headers);

  Future<Map<String, dynamic>> acceptMatch(Map<String, dynamic> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/match/accept",
          data,
          headers);
}
