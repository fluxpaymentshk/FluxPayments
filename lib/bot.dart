import 'dart:convert';
import 'dart:developer';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sigv4/sigv4.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

class Bot extends StatefulWidget {
  const Bot({Key? key}) : super(key: key);

  @override
  _BotState createState() => _BotState();
}

class _BotState extends State<Bot> {
  var result;
  @override
  void initState() {
    super.initState();
    callBot();
  }

  var kAccessKeyId = "AKIAUBDMWDJM2DBSTUYK";
  var kSecretAccessKey = "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";

  Future<http.Response> callBot() async {
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
      body: jsonEncode({'inputText': 'not able to pay bills'}),
    );
    // var response;
    response = await http.post(request.url,
        headers: request.headers, body: request.body);
    result = jsonDecode(response.body);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: FutureBuilder<http.Response>(
            future: callBot(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              log("----------------${result}");
              log("${snapshot.data}");
              return Text(snapshot.data.toString());
            }),
      ),
    ));
  }
}
