import 'dart:ffi';

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class Banner extends Model {
  static const classType = const _BannerModelType();
  double bannerID;
  String? dueDate;
  String? heading;
  String? buttonDesc;
  String? Logo;

  Banner(
      {required this.Logo,
      required this.bannerID,
      required this.buttonDesc,
      required this.dueDate,
      required this.heading});

  Banner.fromJson(Map<String, dynamic> json)
      : bannerID = json["bannerID"],
        dueDate = json["dueDate"],
        heading = json["heading"],
        buttonDesc = json["buttonDesc"],
        Logo = json["logo"];
  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return bannerID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        'bannerID': bannerID,
        'dueDate': dueDate,
        'heading': heading,
        'buttonDesc': buttonDesc,
        'Logo': Logo
      };
}

// ignore: unused_element
class _BannerModelType extends ModelType<Banner> {
  const _BannerModelType();

  @override
  Banner fromJson(Map<String, dynamic> jsonData) {
    return Banner.fromJson(jsonData);
  }
}
