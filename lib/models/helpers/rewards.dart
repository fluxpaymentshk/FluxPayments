
import 'package:flux_payments/models/helpers/shop.dart';

class Rewards {
  String? name;
  // String? category;
  int? price;
  String? shortDesc;
  String? longDesc;
  String? productPic;
  String? color;
  List<Shop>? shops;

  Rewards(
      {this.name,
      // this.category,
      this.price,
      this.shortDesc,
      this.longDesc,
      this.productPic,
      this.color,
      this.shops});

  Rewards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    // category = json['category'];
    price = json['price'];
    shortDesc = json['shortDesc'];
    longDesc = json['longDesc'];
    productPic = json['productPic'];
    color = json['color'];
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
    // data['category'] = this.category;
    data['price'] = this.price;
    data['shortDesc'] = this.shortDesc;
    data['longDesc'] = this.longDesc;
    data['productPic'] = this.productPic;
    data['color'] = this.color;
    if (this.shops != null) {
      data['shops'] = this.shops?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
