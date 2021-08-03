import 'dart:developer';

import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/foundation.dart';
import 'package:flux_payments/models/ExternalAdvertisers.dart';
import 'package:flux_payments/models/InternalAdvertisers.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/Reward.dart';
import 'package:flux_payments/models/RewardPartner.dart';
import 'package:flux_payments/models/Rewards.dart';
import 'package:flux_payments/models/Story.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/banner.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/models/RewardCategory.dart';

enum FluxPointServiceType { ServiceTransaction, referral }

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

  Future<void> getCuratedList(
      {@required int? page, required List<curatedList> curatedListData}) async {
    result = {};
    try {
      List<String> schemaName = [];

      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-function-curatedList',
          <String, dynamic>{"page": page ?? 0});
      result = re;

      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];

      //  Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
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
      // print(
      //     "---------------------------------------------------------------------------------${res}");

      res.forEach((ele) {
        curatedListData.add(new curatedList(
            background: ele["background"],
            categoryID: ele["categoryID"],
            icon: ele["icon"],
            name: ele["icon"],
            tagline: ele["tagline"]));
      });
      // return curatedListData;
      //print("@@@@@@@@@@@@@@@@@@@@@@@@@            ");
      //print(curatedListData[0].background);
    } catch (e) {
      print(e);
      //   return [];
    }
  }

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

/////////////////////////////////////////////
  Future<Map<String, dynamic>> updateFluxPoints(
      {@required String? userID,
      @required FluxPointServiceType? appEvent,
      @required double? servicePoints,
      required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID}) async {
    result = {};
    try {
      log("$servicePoints");
      result = await lambda.callLambda(
          'aurora-serverless-function-FluxPoints', <String, dynamic>{
        "userID": userID,
        "appEvent": appEvent == FluxPointServiceType.ServiceTransaction
            ? "serviceTransaction"
            : "referral",
        "servicePoints": servicePoints
      }).then((value) {
        log("$value");
        return value;
      });
      print(
          "---------------------------------------------------------------------------------$result");
      addUserRewardTransaction(
        rewardTransID: rewardTransID,
        userID: userID,
        amount: amount,
        timestamp: timestamp,
        rewardPartnerID: rewardPartnerID,
        rewardID: rewardID,
        shopID: shopID,
      );
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<double> getFluxPoints(String userID) async {
    Map<String, dynamic> res = {};
    try {
      res = await lambda
          .callLambda('aurora-serverless-getFluxPoints', <String, dynamic>{
        "userID": userID,
      });
      // log("---------------------------------------------------------------------------------${getOrganizedData(result)}");
      var r = res["records"][0][0]["longValue"];
      log("$r");
    } catch (e) {
      print(e);
    }
    return res["records"][0][0]["longValue"];
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
      print("####################");
      print(result);

      print("@@@@@@@@@@@@@@@@@@@@@@@@");

      Map<String, Map<String, double>> mp = {};
      //  Map<String, List<Map<String, double>>> mpnew = {};
      //## print(result.keys);

      //## print('hehehehehehehhehehehehh');
      //## print(mp);
      // return mp;
      return result;
      // mp.forEach((key, value) {
      //   mp[key]?.forEach((ele) {
      //     ele.forEach((key, value) {

      //       if(mpnew[key]!.contains())
      //     });
      //   });
      // });
      //     return mp;
    } catch (e) {
      print(e);

      throw new Exception();
    }
    // return result;
  }

  Future<void> getExternalAdvertiserList(
      {required int? page,
      required List<ExternalAdvertisers> ExternalAdvertisersListData}) async {
    result = {};
    try {
      List<String> schemaName = [];

      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-externalAdvertisers',
          <String, dynamic>{"page": page ?? 0});
      result = re;

      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];

      //  Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
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
      print(
          "---------------------------------------------------------------------------------${res}");

      res.forEach((ele) {
        ExternalAdvertisersListData.add(
          //new ExternalAdvertisers(name: ele["name"], productName: ele["productName"],),
          new ExternalAdvertisers.fromJson(ele),
        );
      });
      // return curatedListData;
      //print("@@@@@@@@@@@@@@@@@@@@@@@@@            ");
      //print(curatedListData[0].background);
    } catch (e) {
      print(e);
      //   return [];
    }
  }

  Future<void> getInternalAdvertiserList(
      {required int? page,
      required List<InternalAdvertisers> internalAdvertisersListData}) async {
    result = {};
    try {
      List<String> schemaName = [];

      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-internalAdvertisers',
          <String, dynamic>{"page": page ?? 0});
      result = re;

      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];

      //  Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
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
      // print(
      //     "---------------------------------------------------------------------------------${res}");

      res.forEach((ele) {
        internalAdvertisersListData.add(
          //new ExternalAdvertisers(name: ele["name"], productName: ele["productName"],),
          new InternalAdvertisers.fromJson(ele),
        );
      });
      // return curatedListData;
      //print("@@@@@@@@@@@@@@@@@@@@@@@@@            ");
      //print(curatedListData[0].background);
    } catch (e) {
      print(e);
      //   return [];
    }
  }

  Future<Banner> getBannerDetails() async {
    try {
      result = {};
      // try {
      List<String> schemaName = [];
      print(
          '##############                Before        ##########################################################');
      Map<String, dynamic> re = await lambda
          .callLambda('aurora-serverless-banner', <String, dynamic>{});
      print(
          '##############                after        ##########################################################');

      result = re;

      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];

      //  Map<String, List<Map<String, dynamic>>> companyWiseData = {};
      re["records"].forEach((e) {
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
      print(
          '########################################################################');
      print(
          "---------------------------------------------------------------------------------${res}");

      List<Banner> bannerList = [];
      Banner banner = new Banner(
          Logo: 'Logo',
          bannerID: 1233.0,
          buttonDesc: '',
          dueDate: '',
          heading: '');
      res.forEach((ele) {
        bannerList.add(
          //new ExternalAdvertisers(name: ele["name"], productName: ele["productName"],),
          banner = Banner.fromJson(ele),
        );
      });
      //return bannerList[0];
      return banner;
      // return curatedListData;
      //print("@@@@@@@@@@@@@@@@@@@@@@@@@            ");
      //print(curatedListData[0].background);
    } catch (e) {
      print(e);

      throw new Exception();
      // return Banner(
      //     Logo: null,
      //     bannerID: null,
      //     buttonDesc: null,
      //     dueDate: null,
      //     heading: null);
    }
  }

  Future<List<Map<String, dynamic>>> getRecentPayment(
      {@required String? userID}) async {
    List<Map<String, dynamic>> recentPayments = [];
    result = {};
    try {
      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-function-recentPayment', <String, dynamic>{
        "userID": userID,
      });
      result = re;
      List<String> schemaName = [];
      re["columnMetadata"].forEach((e) {
        schemaName.add(e["name"]);
      });

      List<dynamic> res = [];
      //  Map<String, List<Map<String, dynamic>>> companyWiseData = {};
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

      // Set<String> nameOfCompanies = {};
      // res.forEach((element) {
      //   nameOfCompanies.add(element["name"]);
      // });

      // nameOfCompanies.forEach((element) {
      //   companyWiseData[element] = [];
      // });
      // res.forEach((element) {
      //   companyWiseData[element["name"]]?.add(element);
      // });
      // result = companyWiseData;
      // log("$result");
      // print("####################");
      // print(result);

      Map<String, dynamic> mp = {};

      res.forEach((ele) {
        mp = {};
        mp.addAll({
          'paidOn': ele['paidOn'],
          'imageurl': ele['logo'],
          'amount': ele['amount'],
          'name': ele['name']
        });
        recentPayments.add(mp);
      });
      print(recentPayments);
      print('ggggggggggg');

      return recentPayments;
    } catch (e) {
      print(e);

      throw new Exception();
    }
    // return result;
  }

  Future<Map<String, dynamic>> getPendingServices(
      {required String userID, required String todayDate}) async {
    try {
      Map<String, dynamic> pendingService = {};
      List pendingServiceDetails = [];
      result = {};
      // try {
      //List<String> schemaName = [];
      print(
          '##############                Beforeeeeeeeeeeeeeeee_____________________       ##########################################################');
      Map<String, dynamic> re = await lambda.callLambda(
          'aurora-serverless-function-pendingPayment',
          <String, dynamic>{"UserID": userID, "todayDate": todayDate});
      print(
          '##############                after        ##########################################################');

      result = re;
      print(result);

      result["records"][0].forEach((ele) {
        ele.forEach((k, v) {
          pendingServiceDetails.add(v);
        });
      });

      pendingService.addAll({
        'dueAmount': double.parse(pendingServiceDetails[0]),
        'dueProviders': pendingServiceDetails[1]
      });
      // print(result["records"][0][1]);
      print(pendingService);
      return pendingService;

      //to check all done or not!
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<RewardCategory>> getCategories() async {
    result = {};
    List<RewardCategory> rp = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-rewardCategory', <String, dynamic>{});
      print(
          "---------------------------------------------------------------------------------${getOrganizedData(result)}");
      List<String> categories = [];
      getOrganizedData(result).forEach((element) {
        rp.add(RewardCategory.fromJson(element));
        log("______________________________________________________________________");
        log("${rp[rp.length - 1].toJson()}");
      });
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
      schema.add(e["label"]);
    });
    List<Map<String, dynamic>> response = [];
    re.forEach((element) {
      int i = 0;
      Map<String, dynamic> m = {};
      // log("$element");
      element.forEach((e) {
        // log("----$e");
        // print(e);
        m[schema[i]] = e["stringValue"] ?? e["doubleValue"];
        i++;
      });
      response.add(m);
    });
    // print("======================================+$response");
    return response;
  }

  Future<List<Rewards>> getRewards() async {
    Map<String, dynamic> r = {};
    List<Rewards> rl = [];
    try {
      r = await lambda
          .callLambda('aurora-serverless-GetRewards', <String, dynamic>{
        // "query": query,
      });
      print(
          "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      // print(r);
      // r["columnMetadata"].forEach((element) {
      //   print(element["name"] + "  " + element["typeName"]);
      // });
      log("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!---------------------------------------------------------------------------------${getOrganizedData(r)}");
      // getOrganizedData(r);
    } catch (e) {
      print(e);
      throw e;
    }
    getOrganizedData(r).forEach((element) {
      rl.add(Rewards.fromJson(element));
      print(rl[rl.length - 1].toJson());
    });
    log("$rl");
    return rl;
  }

  Future<List<Reward>> getUserFavoritesList({@required String? userID}) async {
    result = {};
    List<User> userDetails = [];
    List<Reward> fav = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-function-favorites', <String, dynamic>{
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
        //print(ele);
        //print('///////');
        fav.add(
          // new User(
          //   firstName: ele["firstName"],
          //   uniqueID: userID!,
          //   refreeID: ele["refreeID"],
          //   email:ele["email"],
          //   mobileNumber: ele["mobileNumber"],
          //   referralID: ele["referralID"],
          //   dateOfBirth: ele["dateOfBirth"],

          //   )

          Reward.fromJson(ele),
        );
      });
    } catch (e) {
      print(e);
    }
    print(fav[0].name);
    //return result;
    return fav;
  }

  Future<List<myCoupons>> getUserCouponsList({@required String? userID}) async {
    result = {};
    List<myCoupons> coupons = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-function-myCoupons', <String, dynamic>{
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
        //print(ele);
        //print('///////');
        coupons.add(
          // new User(
          //   firstName: ele["firstName"],
          //   uniqueID: userID!,
          //   refreeID: ele["refreeID"],
          //   email:ele["email"],
          //   mobileNumber: ele["mobileNumber"],
          //   referralID: ele["referralID"],
          //   dateOfBirth: ele["dateOfBirth"],

          //   )

          myCoupons.fromJson(ele),
        );
      });
    } catch (e) {
      print(e);
    }
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    print(coupons);
    //return result;
    return coupons;
  }

  // Future<User> getUserDetails({@required String? userID}) async {
  //   result = {};
  //   List<User> userDetails = [];
  //   try {
  //     result = await lambda.callLambda(
  //         'aurora-serverless-function-userDetails', <String, dynamic>{
  //       "userID": userID,
  //     });
  //     // print(
  //     //     "---------------------------------------------------------------------------------$result");

  //     List<String> schemaName = [];
  //     result["columnMetadata"].forEach((e) {
  //       schemaName.add(e["name"]);
  //     });

  //     List<dynamic> res = [];

  //     result["records"].forEach((e) {
  //       int i = 0;
  //       Map<String, dynamic> m = {};
  //       m = {};
  //       e.forEach((el) {
  //         el.forEach((key, value) {
  //           if (key == "isNull" && value == true)
  //             m[schemaName[i]] = null;
  //           else
  //             m[schemaName[i]] = value;
  //           i++;
  //         });
  //       });
  //       res.add(m);
  //     });
  //     res.forEach((ele) {
  //       //print(ele);
  //       //print('///////');
  //       userDetails.add(
  //         // new User(
  //         //   firstName: ele["firstName"],
  //         //   uniqueID: userID!,
  //         //   refreeID: ele["refreeID"],
  //         //   email:ele["email"],
  //         //   mobileNumber: ele["mobileNumber"],
  //         //   referralID: ele["referralID"],
  //         //   dateOfBirth: ele["dateOfBirth"],

  //         //   )

  //         User.fromJson(ele),
  //       );
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   //print(userDetails[0].toString());
  //   return userDetails[0];
  // }

  Future<List<Story>> getStory() async {
    result = {};
    List<Story> story = [];
    try {
      result = await lambda
          .callLambda('aurora-serverless-function-story', <String, dynamic>{
        "userID": "dummy",
      });
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      print(result);
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
        //print(ele);
        //print('///////');
        story.add(
          // new User(
          //   firstName: ele["firstName"],
          //   uniqueID: userID!,
          //   refreeID: ele["refreeID"],
          //   email:ele["email"],
          //   mobileNumber: ele["mobileNumber"],
          //   referralID: ele["referralID"],
          //   dateOfBirth: ele["dateOfBirth"],

          //   )

          Story.fromJson(ele),
        );
      });
    } catch (e) {
      print(e);
    }
    print(story[0].toString());
    return story;
  }

  Future<void> addUserRewardTransaction(
      {required String? rewardTransID,
      required double? amount,
      required String? timestamp,
      required String? userID,
      required String? rewardPartnerID,
      required String? rewardID,
      required String? shopID}) async {
    result = {};
    try {
      log("@@@");
      var r = await lambda.callLambda(
          'aurora-serverless-function-addRewardTransaction', <String, dynamic>{
        "rewardTransID": rewardTransID,
        "amount": amount,
        "timestamp": timestamp,
        "userID": userID,
        "rewardPartnerID": rewardPartnerID,
        "rewardID": rewardID,
        "shopID": shopID,
      });
    } catch (e) {
      print(e);

      // throw Exception(e);
    }
  }

  Future<bool> getCouponInfo({
    required String? userID,
    required String? rewardID,
  }) async {
    result = {};
    try {
      var r = await lambda.callLambda(
          'aurora-serverless-function-getRewardsUserTransactionInfo',
          <String, dynamic>{
            "userID": userID,
            "rewardID": rewardID,
          });
      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
      // print(result);
      log("11111---------------------------------------------------------------------------------${getOrganizedData(r)}");
      log("${getOrganizedData(r).length}");
      if (getOrganizedData(r).length == 0) return false;
      return true;
    } catch (e) {
      print(e);

      throw Exception(e);
    }
  }
}
