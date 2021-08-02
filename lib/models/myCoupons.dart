import 'dart:ffi';
import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class myCoupons extends Model {
  //aaaaaa
  static const classType = const _CouponsModelType();
  String? myCouponsID;
  bool? isTransactionComp;
  double? amount;
  String? userID;
  String? rewardPartnerID;
  String? rewardID;
  String? validUntill;
  String? shortDescription;
  String? termsncond;
  String? name;
  String? image;

  myCoupons({required this.myCouponsID,required this.isTransactionComp, this.rewardPartnerID, required this.userID,required this.amount, this.rewardID, this.shortDescription, this.termsncond, this.name, this.image});

  myCoupons.fromJson(Map<String, dynamic> json)
      : myCouponsID = json["myCouponsID"],
        isTransactionComp = json["isTransactionComp"],
        rewardPartnerID = json["rewardPartnerID"],
        userID = json["userID"],
        amount = json["amount"],
        rewardID = json["rewardID"],  
        validUntill = json["validUntill"],
        shortDescription = json["shortDescription"],
        termsncond = json["termsncond"],
        name = json["name"],
        image = json["image"];

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
        'amount': amount,
        'rewardID': rewardID,
        'validUntill': validUntill,
        'shortDescription': shortDescription,
        'termsncond': termsncond,
        'name': name,
        'image': image,
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
