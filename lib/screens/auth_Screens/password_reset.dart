import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/reset_password_otp_screen.dart';

class PasswordReset extends StatefulWidget {
  final UserConfigRepository? userConfigRepository;
  const PasswordReset({Key? key, @required this.userConfigRepository})
      : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: FutureBuilder<List<AuthUserAttribute>>(
        future: widget.userConfigRepository?.getUserCredentials(),
        builder: (context, data) {
          if (!data.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print(data.data);
          List<AuthUserAttribute>? l = data.data;
          String email = "";
          l?.forEach((element) {
            if (element.userAttributeKey == "email") {
              print("--------$element");
              email = element.value;
            }
          });
          return BlocProvider<UserBloc>.value(
            value: BlocProvider.of<UserBloc>(context),
            child: ResetPasswordOtpScreen(
                userConfigRepository: widget.userConfigRepository,
                email: email),
          );
        },
      ),
    );
  }
}
