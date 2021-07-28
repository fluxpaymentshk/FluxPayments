import 'dart:ffi';
import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class Favorites extends Model {
  static const classType = const _FavoritesModelType();
  double? favoriteID;
  String? userID;
  String? rewardID;

  Favorites({required this.favoriteID,required this.userID,required this.rewardID});

  Favorites.fromJson(Map<String, dynamic> json)
      : favoriteID = json["favoriteID"],
        userID = json["userID"],
        rewardID = json["rewardID"];
        
  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return favoriteID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        'rewardID': rewardID,
        'userID': userID,
        'favoriteID': favoriteID,
      };
}

// ignore: unused_element
class _FavoritesModelType extends ModelType<Favorites> {
  const _FavoritesModelType();

  @override
  Favorites fromJson(Map<String, dynamic> jsonData) {
    return Favorites.fromJson(jsonData);
  }
}


// class Favorites {
//   int? favoriteID;
//   String? userID;
//   String? rewardID;

//   Favorites({required this.favoriteID,required this.userID,required this.rewardID});
// }