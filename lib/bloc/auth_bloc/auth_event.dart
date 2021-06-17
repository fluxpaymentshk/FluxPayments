import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/foundation.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class EmailLogInUser extends AuthEvent {
  final String email, password;
  const EmailLogInUser(this.email, this.password);
}

class EmailSignUpUser extends AuthEvent {
  final String? email, password;
  final String code;
  final bool resend;
  const EmailSignUpUser(
      {@required this.email,
      @required this.password,
      this.resend = false,
      this.code = ""});
}

class LogOutUser extends AuthEvent {
  const LogOutUser();
}

class SocialSignInUser extends AuthEvent {
  final AuthProvider authProvider;
  const SocialSignInUser(this.authProvider);
}
