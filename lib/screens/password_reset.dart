import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/reset_password_otp_screen.dart';
import 'package:flux_payments/screens/signUp_otp_screen.dart';

class PasswordReset extends StatefulWidget {
  final UserConfigRepository? userConfigRepository;
  const PasswordReset({Key? key, @required this.userConfigRepository})
      : super(key: key);

  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  // final _resetPasswordFormKey = GlobalKey<FormState>();
  // LoginRepository _loginRepository = new LoginRepository();
  // final TextEditingController _oldPasswordController =
  //     new TextEditingController();

  // final TextEditingController _passwordController = new TextEditingController();

  // final TextEditingController _confirmPasswordController =
  //     new TextEditingController();

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
            value:BlocProvider.of<UserBloc>(context),
            child: ResetPasswordOtpScreen(userConfigRepository: widget.userConfigRepository,email: email),
          );
        },
      ),
      // body:
      // SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Form(
      //             key: _changePasswordFormKey,
      //             child: Column(
      //               children: [
      //                 Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: TextFormField(
      //                     controller: _oldPasswordController,
      //                     obscureText: true,
      //                     decoration: InputDecoration(
      //                       border: OutlineInputBorder(),
      //                       labelText: 'Old Password',
      //                       hintText: '******',
      //                     ),
      //                     validator: (s) => _loginRepository
      //                         .validatePasswordFormField(s ?? ""),
      //                   ),

      //                   // )
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: TextFormField(
      //                     controller: _passwordController,
      //                     obscureText: true,
      //                     decoration: InputDecoration(
      //                       border: OutlineInputBorder(),
      //                       labelText: 'New Password',
      //                       hintText: '******',
      //                     ),
      //                     validator: (s) => _loginRepository
      //                         .validatePasswordFormField(s ?? ""),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.all(10),
      //                   child: TextFormField(
      //                     controller: _confirmPasswordController,
      //                     obscureText: true,
      //                     decoration: InputDecoration(
      //                       border: OutlineInputBorder(),
      //                       labelText: 'Confirm Password',
      //                       hintText: '******',
      //                     ),
      //                     validator: (s) => _loginRepository
      //                         .validateConfirmPasswordFormField(
      //                             _confirmPasswordController.value.text,
      //                             _passwordController.value.text),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           Align(
      //             alignment: Alignment.bottomRight,
      //             child: Padding(
      //               padding: const EdgeInsets.all(12),
      //               child: Container(
      //                 height: 35,
      //                 width: 220,
      //                 decoration: BoxDecoration(
      //                     color: Colors.blue,
      //                     borderRadius: BorderRadius.circular(1)),
      //                 child: TextButton(
      //                   onPressed: () {
      //                     bool? r =
      //                         _changePasswordFormKey.currentState?.validate();
      //                     if (r == true) {
      //                       userBloc.add(
      //                         UserChangePasswordEvent(
      //                             oldPassword:
      //                                 _oldPasswordController.value.text,
      //                             newPassword:
      //                                 _passwordController.value.text),
      //                       );
      //                     }
      //                     // Navigator.push(

      //                     //     context, MaterialPageRoute(builder: (_) => HomePage()));
      //                   },
      //                   child: Text(
      //                     'Change Password',
      //                     style: TextStyle(color: Colors.white, fontSize: 17),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //   ],
      // ),
      // ),
    );
  }
}
