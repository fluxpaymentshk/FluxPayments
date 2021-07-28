import 'dart:ffi';
import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class myCoupons extends Model {
  static const classType = const _CouponsModelType();
  String? myCouponsID;
  bool? isTransactionComp;
  double? Amount;
  String? userID;
  String? rewardPartnerID;

  myCoupons({required this.myCouponsID,required this.isTransactionComp, this.rewardPartnerID, required this.userID,required this.Amount});

  myCoupons.fromJson(Map<String, dynamic> json)
      : myCouponsID = json["myCouponsID"],
        isTransactionComp = json["isTransactionComp"],
        rewardPartnerID = json["rewardPartnerID"],
        userID = json["userID"],
        Amount = json["Amount"];
        
  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return myCouponsID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        'myCouponsID': myCouponsID,
        'isTransactionComp': isTransactionComp,
        'rewardPartnerID': rewardPartnerID,
        'userID': userID,
        'Amount': Amount,
      };
}

// ignore: unused_element
class _CouponsModelType extends ModelType<myCoupons> {
  const _CouponsModelType();

  @override
  myCoupons fromJson(Map<String, dynamic> jsonData) {
    return myCoupons.fromJson(jsonData);
  }
}


// class Couponss {
//   int? CouponsID;
//   String? userID;
//   String? rewardID;

//   Couponss({required this.CouponsID,required this.userID,required this.rewardID});
// }