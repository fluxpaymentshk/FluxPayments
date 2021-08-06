import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/user_model.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/services/login_req.dart';
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
  Future<bool> confirmUser(String email, String code);
  Future<void> resendConfirmationCode(String email);
  Future<void> updateUser(String email);
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
      User user = new User(firstName: '', uniqueID: '', refreeID: "ll");
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

  @override
  Future<void> resendConfirmationCode(String email) async {
    try {
      await _userDetailsServices.resendUpdateDetailVerificationCode(email);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> confirmUser(String email, String code) async {
    try {
      return await _userDetailsServices.confirmUserCode(email, code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUser(String email) async {
    try {
      return await _userDetailsServices.updateUserDetails(email);
      
    } catch (e) {
      rethrow;
    }
  }
}
