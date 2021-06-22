
class Shop {
  String? name;
  String? address;
  String? location;
  String? mapLink;
  String? picture;

  Shop({this.name, this.address, this.location, this.mapLink, this.picture});

  Shop.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    location = json['location'];
    mapLink = json['mapLink'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['location'] = this.location;
    data['mapLink'] = this.mapLink;
    data['picture'] = this.picture;
    return data;
  }
}
