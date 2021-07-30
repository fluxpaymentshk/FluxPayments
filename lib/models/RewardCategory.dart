import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

class RewardCategory extends Model {
   static const classType = const _RewardCategoryModelType();
  final String? rewardCategoryID;
  final String? name;
  final String? icon;
  final String? description;


  RewardCategory({
    this.rewardCategoryID,
    this.name,
    this.icon,
    this.description,
  });

  RewardCategory.fromJson(Map<String, dynamic> json)
      : rewardCategoryID = json["rewardCategoryID"],
        name = json["name"],
        icon = json["icon"],
        description = json["description"];

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return rewardCategoryID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": rewardCategoryID,
        "name": name,
        "description": description,
        "icon": icon,
      };
}

// ignore: unused_element
class _RewardCategoryModelType extends ModelType<RewardCategory> {
  const _RewardCategoryModelType();

  @override
  RewardCategory fromJson(Map<String, dynamic> jsonData) {
    return RewardCategory.fromJson(jsonData);
  }
}
