import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/repository/user_config_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserConfigRepository _userConfigRepository;
  UserBloc(this._userConfigRepository) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    yield UserInitialState();
    if (event is UserChangePasswordEvent) {
      try {
        yield UserServiceLoading();
        await _userConfigRepository.changePassword(
            event.oldPassword ?? "", event.newPassword ?? "");
        yield UserServiceDone();
      } on LimitExceededException catch (e) {
        log("$e");
        yield UserServiceError(e.message);
      } on AuthError catch (e) {
        yield UserServiceError("Errror");
      } on NotAuthorizedException catch (er) {
        yield UserServiceError(er.message);
      } catch (e) {
        yield UserServiceError("Error updating password. Try again later!");
      }
    }
    if (event is UserResetPasswordEvent) {
      try {
        yield UserServiceLoading();
        if (event.code != "")
          await _userConfigRepository.resetPassword(event.email ?? "");
        else {
          bool r = await _userConfigRepository.confirmUserResetPassword(
              event.email ?? "", event.newPassword, event.code);
          if (r == true) {
            yield UserServiceDone();
          } else {
            yield UserServiceError("Error resetting password");
          }
        }
        yield UserServiceDone();
      } on AuthError catch (e) {
        yield UserServiceError("Errror");
      } on NotAuthorizedException catch (er) {
        yield UserServiceError(er.message);
      } catch (e) {
        yield UserServiceError("Try again later!");
      }
    }
  }
}
