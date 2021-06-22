import 'package:flux_payments/models/bill_provider.dart';
import 'package:flux_payments/models/payment_options.dart';
import 'package:flux_payments/models/user_rewards.dart';

class UserModel {
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  int? idCardNumber;
  String? uniqueID;
  List<BillProvider>? billProviders;
  String? mobileNumber;
  String? email;
  List<UserRewards>? userRewards;
  List<PaymentOption>? paymentOptions;
  int? fluxPoints;

  UserModel(
      {this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.idCardNumber,
      this.uniqueID,
      this.billProviders,
      this.mobileNumber,
      this.email,
      this.userRewards,
      this.paymentOptions,
      this.fluxPoints});

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dateOfBirth = json['dateOfBirth'];
    idCardNumber = json['idCardNumber'];
    uniqueID = json['uniqueID'];
    if (json['billProviders'] != null) {
      billProviders = [];
      json['billProviders'].forEach((v) {
        billProviders?.add(new BillProvider.fromJson(v));
      });
    }
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    if (json['userRewards'] != null) {
      userRewards = [];
      json['userRewards'].forEach((v) {
        userRewards?.add(new UserRewards.fromJson(v));
      });
    }
    if (json['paymentOptions'] != null) {
      paymentOptions = [];
      json['paymentOptions'].forEach((v) {
        paymentOptions?.add(new PaymentOption.fromJson(v));
      });
    }
    fluxPoints = json['fluxPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dateOfBirth'] = this.dateOfBirth;
    data['idCardNumber'] = this.idCardNumber;
    data['uniqueID'] = this.uniqueID;
    if (this.billProviders != null) {
      data['billProviders'] =
          this.billProviders?.map((v) => v.toJson()).toList();
    }
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    if (this.userRewards != null) {
      data['userRewards'] = this.userRewards?.map((v) => v.toJson()).toList();
    }
    if (this.paymentOptions != null) {
      data['paymentOptions'] =
          this.paymentOptions?.map((v) => v.toJson()).toList();
    }
    data['fluxPoints'] = this.fluxPoints;
    return data;
  }
}


// class UserModel {
//   String? firstName;
//   String? lastName;
//   String? dOB;
//   String? identityCardNumber;
//   String? username;
//   String? password;
//   String? mobileNumber;
//   String? email;
//   String? facebook;
//   String? google;
//   String? uniqueID;
//   List<UserRewards>? userRewards;
//   String? billProviders;
//   String? paymentOptions;
//   int? fluxPoints;
// }

// class UserRewards {}

//Dummyy
class Bills {
  String? title;
  String? desc;
  int? amount;
}


// {
//     "fullName": "",
//     "lastName": "",
//     "dateOfBirth": "",
//     "idCardNumber": 1,
//     "uniqueID": "",
//     "billProviders": [],
//     "mobileNumber": "",
//     "email": "",
//     "userRewards": [],
//     "paymentOptions": [],
//     "fluxPoints": 0,
// }
