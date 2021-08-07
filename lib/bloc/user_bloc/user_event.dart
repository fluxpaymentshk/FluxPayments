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

