import 'dart:convert';
import 'dart:developer';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sigv4/sigv4.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Bot {
  var result;

  String kAccessKeyId = dotenv.env['ACCESS_KEY'] ?? "";
  String kSecretAccessKey = dotenv.env['SECRET_ACCESS_KEY'] ?? "";

  Future<http.Response> callBot(String message) async {
    var response;

    Sigv4Client client = Sigv4Client(
      region: 'ap-southeast-1',
      serviceName: 'lex',
      defaultContentType: 'application/json; charset=utf-8',
      keyId: kAccessKeyId,
      accessKey: kSecretAccessKey,
    );

    final request = client.request(
      "https://runtime.lex.ap-southeast-1.amazonaws.com/bot/Mimi_staging/alias/BETA/user/12345/text",
      method: 'POST',
      body: jsonEncode({'inputText': message}),
    );
    // var response;
    response = await http.post(request.url,
        headers: request.headers, body: request.body);
    result = jsonDecode(response.body);
    return response;
  }
}
