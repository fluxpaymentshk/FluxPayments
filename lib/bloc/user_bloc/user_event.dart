import 'package:flutter/material.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserChangePasswordEvent extends UserEvent {
  final String? oldPassword, newPassword;
  const UserChangePasswordEvent({this.oldPassword, this.newPassword});
}

class UserResetPasswordEvent extends UserEvent {
  final String? email;
  final String code;
  final String newPassword;
  const UserResetPasswordEvent(
      {@required this.email, this.code = "", this.newPassword = ""});
}

class GetUserDetails extends UserEvent {
  final String? userID;
  const GetUserDetails({@required this.userID});
}

class UpdateUserDetails extends UserEvent {
  final String? userID;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phnNumber;
  final String? hkID;
  final bool? isDBChange;
  final bool? resend;
  final String code;
  const UpdateUserDetails({
    @required this.userID,
    @required this.lastName,
    @required this.firstName,
    @required this.email,
    @required this.phnNumber,
    @required this.hkID,
    @required this.isDBChange,
    this.resend = false,
      this.code = ""
  });
}
