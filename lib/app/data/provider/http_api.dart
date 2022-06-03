import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class HttpApiClient {
  static final HttpApiClient _instance = HttpApiClient._internal();

  factory HttpApiClient() => _instance;

  HttpApiClient._internal() {
    print("HttpApiClient was created");
  }

  Future<Map<String, dynamic>> get(
      String uri, Map<String, String> headers) async {
    final innerUri = Uri.parse(uri);

    final http.Response response = await http.post(innerUri, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);

    responseBody['statusCode'] = response.statusCode;
    return responseBody;
  }

  Future<Map<String, dynamic>> post(String uri, Map<String, dynamic> data,
      Map<String, String> headers) async {
    final innerUri = Uri.parse(uri);

    final body = json.encode(data);
    print(body);
    final http.Response response =
        await http.post(innerUri, body: body, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    responseBody['statusCode'] = response.statusCode;
    return responseBody;
  }

  Future<Map<String, dynamic>> delete(String uri, Map<String, dynamic> data,
      Map<String, String> headers) async {
    final innerUri = Uri.parse(uri);

    final body = json.encode(data);
    print(body);
    final http.Response response =
        await http.delete(innerUri, body: body, headers: headers);

    print(response);
    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print(responseBody);
    responseBody['statusCode'] = response.statusCode;
    return responseBody;
  }
}
