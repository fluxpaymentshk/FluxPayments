import 'package:flux_payments/models/helpers/shop.dart';

class RewardPartner {
  String? name;
  String? logo;
  String? companyBanner;
  String? shortDesc;
  int? size;
  List<Shop>? shops;

  RewardPartner(
      {this.name,
      this.logo,
      this.companyBanner,
      this.shortDesc,
      this.size,
      this.shops});

  RewardPartner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    companyBanner = json['companyBanner'];
    shortDesc = json['shortDesc'];
    size = json['size'];
    if (json['shops'] != null) {
      shops = [];
      json['shops'].forEach((v) {
        shops?.add(new Shop.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['companyBanner'] = this.companyBanner;
    data['shortDesc'] = this.shortDesc;
    data['size'] = this.size;
    if (this.shops != null) {
      data['shops'] = this.shops?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
