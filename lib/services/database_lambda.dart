import 'dart:developer';

import 'package:aws_lambda/aws_lambda.dart';
<<<<<<< HEAD
import 'package:flutter/cupertino.dart';
import 'package:flux_payments/models/User.dart';
=======
import 'package:flutter/foundation.dart';
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb

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

<<<<<<< HEAD
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
=======
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
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb
      print(e);
    }
    return result;
  }

<<<<<<< HEAD
  Future<User> getUserDetails({@required String? userID}) async {
    result = {};
    List<User> userDetails = [];
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-userDetails', <String, dynamic>{
        "userID": userID,
      });
      print(
          "---------------------------------------------------------------------------------$result");

      List<String> schemaName = [];
      result["columnMetadata"].forEach((e) {
=======
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
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];
<<<<<<< HEAD

      result["records"].forEach((e) {
=======
      Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb
        int i = 0;
        Map<String, dynamic> m = {};
        m = {};
        e.forEach((el) {
          el.forEach((key, value) {
<<<<<<< HEAD
            if (key == "isNull" && value == true)
              m[schemaName[i]] = null;
            else
              m[schemaName[i]] = value;
=======
            m[schemaName[i]] = value;
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb
            i++;
          });
        });
        res.add(m);
      });
<<<<<<< HEAD
      res.forEach((ele) {
        print(ele);
        print('///////');
        userDetails.add(
          // new User(
          //   firstName: ele["firstName"],
          //   uniqueID: userID!,
          //   refreeID: ele["refreeID"],
          //   email:ele["email"],
          //   mobileNumber: ele["mobileNumber"],
          //   referralID: ele["referralID"],
          //   dateOfBirth: ele["dateOfBirth"],

          //   )

          User.fromJson(ele),
        );
      });
    } catch (e) {
      print(e);
    }
    print(userDetails[0].toString());
    return userDetails[0];
  }



  Future<User> getUserFavorites({@required String? userID}) async {
    result = {};
    List<User> userDetails = [];
    try {
      result = await lambda.callLambda(
          'aurora-serverless-function-favorites', <String, dynamic>{
        "userID": userID,
      });
      print(
          "---------------------------------------------------------------------------------$result");

      List<String> schemaName = [];
      result["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];

      result["records"].forEach((e) {
        int i = 0;
        Map<String, dynamic> m = {};
        m = {};
        e.forEach((el) {
          el.forEach((key, value) {
            if (key == "isNull" && value == true)
              m[schemaName[i]] = null;
            else
              m[schemaName[i]] = value;
            i++;
          });
        });
        res.add(m);
      });
      res.forEach((ele) {
        print(ele);
        print('///////');
        userDetails.add(
          // new User(
          //   firstName: ele["firstName"],
          //   uniqueID: userID!,
          //   refreeID: ele["refreeID"],
          //   email:ele["email"],
          //   mobileNumber: ele["mobileNumber"],
          //   referralID: ele["referralID"],
          //   dateOfBirth: ele["dateOfBirth"],

          //   )

          User.fromJson(ele),
        );
      });
    } catch (e) {
      print(e);
    }
    print(userDetails[0].toString());
    return userDetails[0];
  }

=======

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
>>>>>>> b60c8188dba7a268422e86f357a5b825e2253cbb
}
