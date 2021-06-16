import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';

class UserDetailsServices {
  Future<List<AuthUserAttribute>> getUserCredentials() async {
    try {
      List<AuthUserAttribute> res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        log('-----key: ${element.userAttributeKey}; value: ${element.value}');
      });
      return res;
    } on AuthException catch (e) {
      print(e.message);
      throw Exception("Error");
    }
  }

  Future<void> userChangePassword(
      String oldPassword, String newPassword) async {
    log("Pss->   .= $oldPassword");
    log("NePss->    .=$newPassword");
    try {
      await Amplify.Auth.updatePassword(
        newPassword: newPassword,
        oldPassword: oldPassword,
      );
    } on LimitExceededException catch (e) {
      throw LimitExceededException("Limit Exceeded");
    } on AuthError catch (e) {
      print(e);
      throw AuthError(e.message);
    } on NotAuthorizedException catch (e) {
      throw NotAuthorizedException("Incorrect Username or password");
    } on Exception catch (e) {
      throw e;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> confirmUserResetPassword(
      String email, String password, String code) async {
    try {

   await Amplify.Auth.confirmPassword(
        username: email,
        newPassword: password,
        confirmationCode: code,
      );
      return true;
    } on AuthError catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      ResetPasswordResult res = await Amplify.Auth.resetPassword(
        username: email,
      );
    
    } on AuthError catch (e) {
      print(e);
    }
  }
}
