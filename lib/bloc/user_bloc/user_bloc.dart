import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/size_config.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserConfigRepository _userConfigRepository;
  final DatabaseRepository _databaseRepository;
  UserBloc(this._userConfigRepository, this._databaseRepository)
      : super(UserInitialState());
  String uid = "bbbb";
  String get getUserID {
    return uid;
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    final UserConfigRepository userConfigRepository = UserConfigRepository();
    yield UserInitialState();
    if (event is UserChangePasswordEvent) {
      try {
        yield UserServiceLoading();
        await _userConfigRepository.changePassword(
            event.oldPassword ?? "", event.newPassword ?? "");
        yield UserChangePasswordDone();
        print("hi");
      } on LimitExceededException catch (e) {
        log("$e");
        yield UserServiceError(e.message);
      } on AuthError catch (e) {
        yield UserServiceError("Errror");
      } on NotAuthorizedException catch (er) {
        yield UserServiceError(er.message);
      } catch (e) {
        yield UserServiceError("Error updating password. Try ag ain later!");
      }
    }
    if (event is UserResetPasswordEvent) {
      try {
        log("1");
        if (event.code == "") {
          await _userConfigRepository.resetPassword(event.email ?? "");
          yield UserServiceDone();
        } else {
          bool r = await _userConfigRepository.confirmUserResetPassword(
              event.email ?? "", event.newPassword, event.code);
          log(r.toString());
          if (r == true) {
            yield UserResetPasswordDone();
          } else {
            yield UserServiceError("Error resetting password");
          }
        }
        yield UserServiceDone();
      } on LimitExceededException catch (e) {
        log("$e");
        yield UserServiceError(e.message);
      } on AuthError catch (e) {
        yield UserServiceError("Errror");
      } on NotAuthorizedException catch (er) {
        yield UserServiceError(er.message);
      } catch (e) {
        yield UserServiceError("Try again later!");
      }
    }

    if (event is GetUserDetails) {
      try {
        log("111111111111111111111111111 ${event.userID.toString()}");
        yield UserDetailsLoading();
        var userdetails = await userConfigRepository.fetchUserDetails();
        uid = userdetails.userSub!;
        User user = await _databaseRepository.getUserDetails(userID: uid);
        yield UserDetails(user: user);
      } catch (e) {
        log(e.toString());
        yield UserDetailsError("${uid}aaaaa");
      }
    }

    if (event is UpdateUserDetails) {
      try {
        yield UserDetailsUpdating();
        await _databaseRepository.updateUserDetails(
            userID: event.userID!,
            firstName: event.firstName!,
            lastName: event.lastName!,
            hkID: event.hkID!,
            email: event.email!,
            phnNumber: event.phnNumber!);
        yield UserServiceDone();
      } catch (e) {
        yield UserDetailsError("unable to update User Details!");
      }
    }
  }
}
