import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

import 'package:codelivery/app/data/provider/http_api.dart';

class SignApiClient {
  static final SignApiClient _instance = SignApiClient._internal();
  late final HttpApiClient httpApiClient;

  factory SignApiClient() => _instance;

  SignApiClient._internal() {
    httpApiClient = HttpApiClient();
    print("RegisterApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/user/signup",
          data,
          headers);

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async =>
      await httpApiClient.post(
          'http://' + dotenv.env['SERVER_IP']! + ":8080/user/login",
          data,
          headers);
}
