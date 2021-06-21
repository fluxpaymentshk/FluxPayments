import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/services/login_req.dart';

abstract class LoginBaseRepository {
  Future<bool> socialSignIn(AuthProvider authProvider);
  Future<String> signIn(String email, String password);
  Future<String> signUp(
      String email, String password, String phnNumber, String name);
  Future<bool> confirmUser(String email, String code);
  Future<void> signOut();
  Future<bool> isUserSignedIn();
  Future<void> resendConfirmationCode(String email);
  String? validateField(String s);
  String? validateEmailFormField(String email);
  String? validatePasswordFormField(String password);
  String? validateConfirmPasswordFormField(
      String password, String confirmPassword);
}

class LoginRepository implements LoginBaseRepository {
  FormValidator _formValidator = new FormValidator();
  AmplifyLogin _amplifyLoginreq = new AmplifyLogin();

  @override
  Future<bool> socialSignIn(AuthProvider authProvider) async {
    try {
      return await _amplifyLoginreq.socialSignInUser(authProvider);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signIn(String email, String password) async {
    try {
      return await _amplifyLoginreq.signInUser(email, password);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signUp(
      String email, String password, String phnNumber, String name) async {
    try {
      return await _amplifyLoginreq.emailSignUpUser(
          email, password, phnNumber, name);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    return await _amplifyLoginreq.signOutUser();
  }

  @override
  Future<bool> isUserSignedIn() async {
    return await _amplifyLoginreq.isUserSignedIn();
  }

  @override
  Future<bool> confirmUser(String email, String code) async {
    try {
      return await _amplifyLoginreq.confirmUser(email, code);
    } catch (e) {
      rethrow;
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
      await _amplifyLoginreq.resendVerificationCode(email);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  String? validateField(String s) {
    return _formValidator.validateField(s);
  }
}
