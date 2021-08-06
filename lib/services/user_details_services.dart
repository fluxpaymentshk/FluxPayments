import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/user_model.dart';

class UserDetailsServices {
  Future<List<AuthUserAttribute>> getUserCredentials() async {
    //  UserModel user = new UserModel();
    try {
      List<AuthUserAttribute> res = await Amplify.Auth.fetchUserAttributes();
      // print('hhhhhhhhhhhhhhhhhhhhhhhhhhh');
      // print(res);
      // res.forEach((element) {
      //   print('-----key: ${element.userAttributeKey}; value: ${element.value}');
      //   if (element.userAttributeKey == 'email') user.email = element.value;
      //  if (element.userAttributeKey == 'custom:username') user.username = element.value;

      //  });
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
      var r = await Amplify.Auth.updatePassword(
        newPassword: newPassword,
        oldPassword: oldPassword,
      );
      log("done");
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
      log("-----------------------------------------------ReSet---------------------------");
      ResetPasswordResult res = await Amplify.Auth.resetPassword(
        username: email,
      );
      log("=====${res.nextStep.updateStep}");
      if (res.nextStep.updateStep == "CONFIRM_RESET_PASSWORD_WITH_CODE") {
        log("huryr");
      }
    } on AuthError catch (e) {
      print(e);
    }
  }

  Future<void> updateUserDetails(
    String email,
  ) async {
    var attributes = [
      AuthUserAttribute(userAttributeKey: 'email', value: email),
    ];
    try {
      var res = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: 'email',
        value: email,
      );
      if (res.nextStep.updateAttributeStep == 'CONFIRM_ATTRIBUTE_WITH_CODE') {
        var destination = res.nextStep.codeDeliveryDetails?.destination;
        print('Confirmation code sent to $destination');
      } else {
        print('Update completed');
      }
    } on AmplifyException catch (e) {
      print(e.message);
    }
  }

  Future<bool> confirmUserCode(String email, String code) async {
    try {
      ConfirmUserAttributeResult res = await Amplify.Auth.confirmUserAttribute(
          userAttributeKey: 'email', confirmationCode: code);
      log("+++++++++++++++++++++++++++++++++++++++$res");
      return true;
    } on CodeMismatchException catch (e) {
      throw CodeMismatchException(e.recoverySuggestion ?? "");
    }
  }

  Future<void> resendUpdateDetailVerificationCode(String email) async {
    try {
      var res = await Amplify.Auth.resendUserAttributeConfirmationCode(
        userAttributeKey: 'email',
      );
      var destination = res.codeDeliveryDetails.destination;
      print('Confirmation code set to $destination');
    } on LimitExceededException catch (e) {
      throw LimitExceededException(e.message);
    } catch (e) {
      throw e;
    }
  }
}
