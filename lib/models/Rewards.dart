import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

class Rewards extends Model {
  static const classType = const _RewardsModelType();
  String? rewardID;
  String? name;
  String? categoryID;
  String? shortDescription;
  String? longDescription;
  double? amount;
  String? image;
  String? rewardPartnerID;
  String? termsncond;
  String? shopID;
  String? shopName;
  String? address;
  String? mapLink;
  double? latitude;
  double? longitude;
  double? distance;
  String? rewardPartnerName;
  String? expiryDate;
  String? bannerImage;
  String? rewardPartnerLogo;

  Rewards({
    this.rewardID,
    this.name,
    this.categoryID,
    this.shortDescription,
    this.longDescription,
    this.amount,
    this.image,
    this.rewardPartnerID,
    this.termsncond,
    this.shopID,
    this.shopName,
    this.address,
    this.mapLink,
    this.latitude,
    this.longitude,
    this.distance,
    this.rewardPartnerName,
    this.expiryDate,
    this.bannerImage,
    this.rewardPartnerLogo,
  });

  Rewards.fromJson(Map<String, dynamic> json)
      : rewardID = json["rewardID"],
        name = json["name"],
        categoryID = json["categoryID"],
        shortDescription = json["shortDescription"],
        longDescription = json["longDescription"],
        amount = json["amount"],
        image = json["image"],
        rewardPartnerID = json["rewardPartnerID"],
        termsncond = json["termsncond"],
        shopID = json['shopID'],
        shopName = json['shopName'],
        address = json["address"],
        mapLink = json["mapLink"],
        longitude = json["longitude"],
        latitude = json["latitude"],
        rewardPartnerName = json["rewardPartnerName"],
        expiryDate = json["expiryDate"],
        bannerImage = json["bannerImage"],
        rewardPartnerLogo=json["rewardPartnerLogo"];

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return rewardID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        "rewardID": rewardID,
        "name": name,
        "categoryID": categoryID,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "amount": amount,
        "image": image,
        "rewardPartnerID": rewardPartnerID,
        "termsncond": termsncond,
        "shopID": shopID,
        "shopName": shopName,
        "address": address,
        "mapLink": mapLink,
        "longitude": longitude,
        "latitude": latitude,
        "rewardPartnerName": rewardPartnerName,
        "expiryDate": expiryDate,
        "bannerImage": bannerImage,
        "rewardPartnerLogo":rewardPartnerLogo
      };
}

// ignore: unused_element
class _RewardsModelType extends ModelType<Rewards> {
  const _RewardsModelType();

  @override
  Rewards fromJson(Map<String, dynamic> jsonData) {
    return Rewards.fromJson(jsonData);
  }
}
