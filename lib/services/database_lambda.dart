import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/cupertino.dart';

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

  Future<Map<String, dynamic>> test() async {
    result = {};
    try {
      result = await lambda
          .callLambda('aurora-serverless-function-referral', <String, dynamic>{
        'key1': ["1234vidd", "flux-vid3"],
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> CouponToTransaction() async {
    result = {};
    try {
      result = await lambda.callLambda('CouponAurora', <String, dynamic>{
        "shopID": "shop1",
        "rewardID": "reward1",
        "myCouponsID": "coupon1",
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> fetchCreditCardInfo({@required userID}) async {
    result = {};
    try {
      result = await lambda.callLambda('aurora-serverless-function-creditCard', <String, dynamic>{
        "userID": userID
      });
      //print("${result['records']}");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> fetchDebitCardInfo({@required userID}) async {
    result = {};
    try {
      result = await lambda.callLambda('aurora-serverless-function-debitCard', <String, dynamic>{
        "userID": userID
      });
      //print("${result['records']}");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> fetchbankInfo({@required userID}) async {
    result = {};
    try {
      result = await lambda.callLambda('aurora-serverless-function-bank', <String, dynamic>{
        "userID": userID
      });
      //print("${result['records']}");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> fetchUserWalletInfo({@required userID}) async {
    result = {};
    try {
      result = await lambda.callLambda('aurora-serverless-function-userWallet', <String, dynamic>{
        "userID": userID
      });
      //print("${result['records']}");
    } catch (e) {
      print("ERROR !!!!!!");
      print(e);
    }
    return result;
  }

}
