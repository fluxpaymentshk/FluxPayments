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
          'ConnectionTimeout': 100000,
          'SocketTimeout': 100000
        });
  }

  Future<Map<String, dynamic>> updateFluxPoints(
      {@required String? userID,
      @required String? appEvent,
      @required int? servicePoints}) async {
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

  Future<Map<String, dynamic>> getUserBillProviderDetails(
      {@required String? userID}) async {
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

  Future<Map<String, dynamic>> getUserRewardDetails(
      {@required String? userID}) async {
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

  Future<Map<String, dynamic>> getSingleTransactionDetails(
      {@required String? userID,
      @required String? serviceTransactionID}) async {
    result = {};
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-SingleTransactionDetail',
          <String, dynamic>{
            "userID": userID,
            "serviceTransactionID": serviceTransactionID
          });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<Map<String, dynamic>> getPaymentHistoryProviderWiseDetails(
      {@required String? userID}) async {
    result = {};
    try {
      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-function-PaymentHistory', <String, dynamic>{
        "userID": userID,
      });
      result = re;
      List<String> schemaName = [];
      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];
      Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
        int i = 0;
        Map<String, dynamic> m = {};
        m = {};
        e.forEach((el) {
          el.forEach((key, value) {
            m[schemaName[i]] = value;
            i++;
          });
        });
        res.add(m);
      });

      Set<String> nameOfCompanies = {};
      res.forEach((element) {
        nameOfCompanies.add(element["name"]);
      });

      nameOfCompanies.forEach((element) {
        companyWiseData[element] = [];
      });
      res.forEach((element) {
        companyWiseData[element["name"]]?.add(element);
      });
      result = companyWiseData;
      log("$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    result = {};
    List<Map<String, dynamic>> rp = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-rewardCategory', <String, dynamic>{});
      print(
          "---------------------------------------------------------------------------------$result");
      List<String> categories = [];
      rp = getOrganizedData(result);
      log("$rp");
    } catch (e) {
      print(e);
    }
    return rp;
  }

  List<Map<String, dynamic>> getOrganizedData(Map<String, dynamic> result) {
    List<String> schema = [];
    List re = result["records"];
    result["columnMetadata"].forEach((e) {
      schema.add(e["name"]);
    });
    List<Map<String, dynamic>> response = [];
    re.forEach((element) {
      int i = 0;
      Map<String, dynamic> m = {};
      // log("$element");
      element.forEach((e) {
        // log("----$e");
        m[schema[i]] = e["stringValue"];
        i++;
      });
      response.add(m);
    });
    // print("======================================+$response");
    return response;
  }

  Future<List<Map<String, dynamic>>> searchFavorites(String query) async {
    Map<String, dynamic> r = {};
    List<Map<String, dynamic>> rp = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-rewardCategory', <String, dynamic>{
        "query": query,
      });
      print(
          "---------------------------------------------------------------------------------$result");
    } catch (e) {
      print(e);
      throw e;
    }
    return getOrganizedData(result);
  }
}
