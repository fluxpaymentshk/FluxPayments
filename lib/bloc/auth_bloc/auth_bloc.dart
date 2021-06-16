import 'dart:developer';
// form_validator
// password_change/password_recovery

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_event.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/repository/login_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginRepository _loginRepository;
  AuthBloc(this._loginRepository) : super(AuthInitial());

  Future<bool> get currentUser async => await _loginRepository.isUserSignedIn();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    var request;
    yield (AuthInitial());
    if (event is EmailSignUpUser) {
      try {
        if (event.resend == true) {
          await _loginRepository.resendConfirmationCode(event.email??"");
        }
        else if (event.code != "") {
          try {
            bool getCode = await _loginRepository.confirmUser(
                event.email ?? "", event.code);
            if (getCode) {
              yield (ConfirmUserState());
            } else {
              yield (AuthError("Wrong Code"));
            }
          } on CodeMismatchException catch (e) {
            log(e.toString());
            yield AuthError(e.message);
          }
        } else {
          request = await _loginRepository.signUp(
              event.email ?? "", event.password ?? "");
          yield UserSignedUpAuthState();
        }
      } on UsernameExistsException catch (e) {
        yield AuthError(e.message);
      } catch (e) {
        print(e);
        if (e.toString().contains("There is already a user  signed in")) {
          yield UserSignedInAuthState();
        } else
          yield (AuthError("Sign Up Error"));
      }
    }
    if (event is EmailLogInUser) {
      try {
        bool userSignedIn = await currentUser;
        log("83883---->$userSignedIn");
        if (!userSignedIn)
          request = await _loginRepository.signIn(event.email, event.password);
        yield (UserSignedInAuthState());
      } on NotAuthorizedException catch (e) {
        print(e);
        yield (AuthError("Wrong Email or password"));
      } on Exception catch (e) {
        print("Exception: $e");
        yield (AuthError(e.toString()));
      }
    }
    if (event is SocialSignInUser) {
      try {
        await _loginRepository.socialSignIn(event.authProvider);
        yield UserSignedInAuthState();
      } on AuthException catch (e) {
        yield AuthError("Error logging in!");
      }
    }

    if (event is LogOutUser) {
      try {
        await _loginRepository.signOut();
        yield (AuthInitial());
      } catch (e) {
        print(e);
        yield (AuthError("Error loggin out user!"));
        Future.delayed(Duration(seconds: 2)).then((_) async* {
          yield (AuthInitial());
        });
      }
    }
  }
}
