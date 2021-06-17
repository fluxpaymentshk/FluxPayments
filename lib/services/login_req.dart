//// @dart=2.9
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_auth_cognito/method_channel_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';

class AmplifyLogin {
  Future<bool> isUserSignedIn() async {
    try {
      var r = await Amplify.Auth.fetchAuthSession(
              options: CognitoSessionOptions(getAWSCredentials: true))
          as CognitoAuthSession;
      log("${r.credentials} ,  ${r.identityId}  , ${r.userPoolTokens}   ,  ${r.userSub}");
      return r.isSignedIn;
    } catch (e) {
      return false;
    }
  }

  Future<bool> socialSignInUser(AuthProvider authProvider) async {
    try {
      var res = await Amplify.Auth.signInWithWebUI(provider: authProvider);
      return res.isSignedIn;
    } catch (e) {
      throw AuthException("Error Signing in");
    }
  }

  Future<String> emailSignUpUser(String email, String password) async {
    try {
      SignUpResult res = await Amplify.Auth.signUp(
          username: email,
          password: password,
          options: CognitoSignUpOptions(
              userAttributes: {"email": email, "username": "Test"}));
      print("Sign up: " + (res.isSignUpComplete ? "Complete" : "Not Complete"));
      return "";
    } on UsernameExistsException catch (e) {
      log("$e");
      throw UsernameExistsException(e.message);
    } catch (e) {
      print(e);
      throw Exception("Register Error: " + e.toString());
    }
  }

  Future<String> signInUser(String email, String password) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: email,
        password: password,
      );
      print(res.isSignedIn ? "signed in" : "no");
      return "";
    } on NotAuthorizedException catch (e) {
      log("28288282---->$e");
      throw NotAuthorizedException(e.underlyingException);
    } on AuthException catch (er) {
      log("2#####-$er");
      throw Exception(er.underlyingException);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> confirmUser(String email, String code) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
          username: email, confirmationCode: code);
      return res.isSignUpComplete;
    } on CodeMismatchException catch (e) {
      throw CodeMismatchException(e.recoverySuggestion);
    }
  }

  Future<void> resendVerificationCode(String email) async {
    try {
      await Amplify.Auth.resendSignUpCode(username: email);
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOutUser() async {
    await Amplify.Auth.signOut();
  }
}
