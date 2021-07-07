import 'dart:developer';

import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/foundation.dart';

class DatabaseLambdaService {
  Map<String, dynamic> result = {};
  late AWSLambda lambda;
  DatabaseLambdaService() {
    lambda = AWSLambda('ap-southeast-1:5ba0e7c3-a382-4455-9fb7-44b0631c26c0',
        region: 'ap-southeast-1',
        cognitoRegion: 'ap-southeast-1',
        clientConfiguration: <String, dynamic>{
          'ConnectionTimeout': 60000,
          'SocketTimeout': 60000
        });
  }

  Future<Map<String, dynamic>> updateFluxPoints({@required String? userID,@required String? appEvent,@required int? servicePoints}) async {
    result = {};
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-FluxPoints', <String, dynamic>{
        "userID": userID,
        "appEvent": appEvent,
        "servicePoints": servicePoints
      }).then((value) {
        log("$value");
        return value;
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> getUserBillProviderDetails({@required String? userID}) async {
    result = {};
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-UserBillProvider', <String, dynamic>{
        "userID": userID,
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> getUserRewardDetails({@required String? userID}) async {
    result = {};
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-UserRewards', <String, dynamic>{
        "userID": userID,
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }
  
  Future<Map<String, dynamic>> getSingleTransactionDetails({@required String? userID,@required String? serviceTransactionID}) async {
    result = {};
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-SingleTransactionDetail', <String, dynamic>{
        "userID": userID,
        "serviceTransactionID":serviceTransactionID
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }
}
