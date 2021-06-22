import 'package:flux_payments/models/helpers/service.dart';

class BillProviders {
	BillProvider? billProviders;

	BillProviders({this.billProviders});

	BillProviders.fromJson(Map<String, dynamic> json) {
		billProviders = json['billProviders'] != null ? new BillProvider.fromJson(json['billProviders']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.billProviders != null) {
      data['billProviders'] = this.billProviders?.toJson();
    }
		return data;
	}
}

class BillProvider {
  String? accountID;
  String? uniqueID;
  List<String>? categories;
  List<Service>? services;

  BillProvider({this.accountID, this.uniqueID, this.categories, this.services});

  BillProvider.fromJson(Map<String, dynamic> json) {
    accountID = json['accountID'];
    uniqueID = json['uniqueID'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(v.toString());
      });
    }
    if (json['services'] != null) {
      services = [];
      json['services'].forEach((v) {
        services?.add(new Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountID'] = this.accountID;
    data['uniqueID'] = this.uniqueID;
    if (this.categories != null) {
      data['categories'] = this.categories?.map((v) => v).toList();
    }
    if (this.services != null) {
      data['services'] = this.services?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


// {
//     "accountID": "",
//     "uniqueID": "",
//     "categories": [],
//     "services": []
// }
