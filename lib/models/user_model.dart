class UserModel {
  String? firstName;
  String? lastName;
  String? dOB;
  String? identityCardNumber;
  String? username;
  String? password;
  String? mobileNumber;
  String? email;
  String? facebook;
  String? google;
  String? uniqueID;
  List<UserRewards>? userRewards;
  String? billProviders;
  String? paymentOptions;
  int? fluxPoints;
}

class UserRewards {}

//Dummyy
class Bills {
  String? title;
  String? desc;
  int? amount;
}
