import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/services/user_details_services.dart';

abstract class UserConfigBaseRepository {
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<List<AuthUserAttribute>> getUserCredentials();
  Future<void> resetPassword(String email);
  Future<bool> confirmUserResetPassword(
      String email, String password, String code);
  String? validateEmailFormField(String email);
  String? validatePasswordFormField(String password);
  String? validateConfirmPasswordFormField(
      String password, String confirmPassword);
}

class UserConfigRepository extends UserConfigBaseRepository {
  FormValidator _formValidator = new FormValidator();
  UserDetailsServices _userDetailsServices = new UserDetailsServices();

  @override
  Future<String> changePassword(String oldPassword, String newPassword) async {
    print(oldPassword);
    print(newPassword);
    try {
      await _userDetailsServices.userChangePassword(oldPassword, newPassword);
      return "Success";
    } on AuthError catch (e) {
      rethrow;
    } on NotAuthorizedException catch (e) {
      log(e.toString());
      rethrow;
      // return ("Incorrect password");
    } on Exception catch (e) {
      rethrow;
      // throw Exception("c");
      // Exception("Errro");
    }
  }

  @override
  Future<List<AuthUserAttribute>> getUserCredentials() async {
    try {
      return await _userDetailsServices.getUserCredentials();
    } catch (e) {
      log(e.toString());
      // throw Exception(e);
      rethrow;
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      return await _userDetailsServices.resetPassword(email);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> confirmUserResetPassword(
      String email, String password, String code) async {
    try {
      return await _userDetailsServices.confirmUserResetPassword(
          email, password, code);
    } catch (e) {
      return false;
    }
  }

  String? validateEmailFormField(String email) {
    return _formValidator.validateEmail(email);
  }

  @override
  String? validateConfirmPasswordFormField(
      String password, String confirmPassword) {
    return _formValidator.validateConfirmPassword(password, confirmPassword);
  }

  @override
  String? validatePasswordFormField(String password) {
    return _formValidator.validatePassword(password);
  }
}
