import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_dotenv/flutter_dotenv.dart';

var baseUrl = Uri.parse(dotenv.env['SERVER_ADDRESS']!);
var headers = {
  'Content-Type': 'application/json'
};

class ApiClient {
  late final http.Client httpClient;
  ApiClient({required this.httpClient});

  getAll() async {
    try {
      final response = await httpClient.get(baseUrl, headers: headers);
      // code ...
    } catch(e) {
      print(e);
    }
  }

  postAll() async {
    try {
      final body = json.encode({});
      final response = await httpClient.post(baseUrl, headers: headers, body: body);
    } catch(e) {
      print(e);
    }
  }
}