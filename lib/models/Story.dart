import 'dart:ffi';
import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class Story extends Model {
  static const classType = const _StoryModelType();
  String? text;
  String? url;
  String? caption;

  Story({required this.text,required this.url,required this.caption});

  Story.fromJson(Map<String, dynamic> json)
      : text = json["text"],
        url = json["url"],
        caption = json["caption"];
        
  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return text.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        'text': text,
        'url': url,
        'caption': caption,
      };
}

// ignore: unused_element
class _StoryModelType extends ModelType<Story> {
  const _StoryModelType();

  @override
  Story fromJson(Map<String, dynamic> jsonData) {
    return Story.fromJson(jsonData);
  }
}


// class Favorites {
//   int? favoriteID;
//   String? userID;
//   String? rewardID;

//   Favorites({required this.favoriteID,required this.userID,required this.rewardID});
// }