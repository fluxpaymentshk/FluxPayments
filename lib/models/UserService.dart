import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

class UserServicePayments extends Model {
  static const classType = const _UserServicePaymentsModelType();
  final String? userServiceID;
  final String? dueDate;
  final String? userID;
  final double? amount;
  final String? billProviderName;
  final String? billProviderLogo;
  final double? fluxPoints;

  UserServicePayments({
    this.userServiceID,
    this.dueDate,
    this.userID,
    this.amount,
    this.billProviderName,
    this.billProviderLogo,
    this.fluxPoints,
  });

  UserServicePayments.fromJson(Map<String, dynamic> json)
      : userServiceID = json["userServiceID"],
        dueDate = json["dueDate"],
        userID = json["userID"],
        amount = json["amount"],
        fluxPoints = json["fluxPoints"],
        billProviderName = json["billProviderName"],
        billProviderLogo = json["billProviderLogo"];

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return userServiceID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        "userServiceID": userServiceID,
        "dueDate": dueDate,
        "userID": userID,
        "amount": amount,
        "billProviderName": billProviderName,
        "billProviderLogo": billProviderLogo,
        "fluxPoints": fluxPoints,
      };
}

// ignore: unused_element
class _UserServicePaymentsModelType extends ModelType<UserServicePayments> {
  const _UserServicePaymentsModelType();

  @override
  UserServicePayments fromJson(Map<String, dynamic> jsonData) {
    return UserServicePayments.fromJson(jsonData);
  }
}
