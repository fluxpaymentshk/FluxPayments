import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/auth_Screens/reset_password_otp_screen.dart';


class ForgetPasswordScreen extends StatelessWidget {
  final UserConfigRepository? userConfigRepository;
  final LoginRepository? loginRepository;
  ForgetPasswordScreen(
      {Key? key, this.userConfigRepository, this.loginRepository})
      : super(key: key);
  final TextEditingController _emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Enter your email Id:",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email ID',
                  hintText: 'abc@xyz.com',
                ),
                validator: (s) =>
                    loginRepository?.validateEmailFormField(s ?? ""),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  bool? r = _formKey.currentState?.validate();
                  if (r == true)
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: userBloc,
                          child: Scaffold(
                            body: ResetPasswordOtpScreen(
                              userConfigRepository: userConfigRepository,
                              email: _emailController.value.text.trim(),
                            ),
                          ),
                        ),
                      ),
                    );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
