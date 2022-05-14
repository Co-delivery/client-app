import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

import 'package:codelivery/app/data/model/user.dart';

class RegisterApiClient {
  static final RegisterApiClient _instance = RegisterApiClient._internal();

  factory RegisterApiClient() => _instance;

  RegisterApiClient._internal() {
    print("RegisterApiClient was created");
  }

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    final uri =
        Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/register");

    final body = json.encode(data);
    print(body);
    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    return responseBody;
  }

  Future<bool> alreadyNickname(String nickname) async {
    final uri = Uri.parse(
        dotenv.env['SERVER_ADDRESS']! + ":3000/user/nickname?nickname=testjsh");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    return responseBody['result'];
  }

  Future<Map<String, dynamic>> alreadyAccount(String address) async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! +
        ":3000/auth/user/alreadyAccount?address=$address");

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    return responseBody;
  }
}
