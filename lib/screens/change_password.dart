import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/services/user_details_services.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _changePasswordFormKey = GlobalKey<FormState>();
  LoginRepository _loginRepository = new LoginRepository();
  final TextEditingController _oldPasswordController =
      new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  final TextEditingController _confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Change'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserServiceError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 5),
                ),
              );
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          // listener: (context, state) {

          // },
          builder: (ctx, state) {
            if (state is UserServiceLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            // if(state is UserInitialState)
            return SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _changePasswordFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _oldPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Old Password',
                              hintText: '******',
                            ),
                            validator: (s) => _loginRepository
                                .validatePasswordFormField(s ?? ""),
                          ),

                          // )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'New Password',
                              hintText: '******',
                            ),
                            validator: (s) => _loginRepository
                                .validatePasswordFormField(s ?? ""),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Confirm Password',
                              hintText: '******',
                            ),
                            validator: (s) => _loginRepository
                                .validateConfirmPasswordFormField(
                                    _confirmPasswordController.value.text,
                                    _passwordController.value.text),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        height: 35,
                        width: 220,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(1)),
                        child: TextButton(
                          onPressed: () {
                            bool? r =
                                _changePasswordFormKey.currentState?.validate();
                            if (r == true) {
                              userBloc.add(
                                UserChangePasswordEvent(
                                    oldPassword:
                                        _oldPasswordController.value.text,
                                    newPassword:
                                        _passwordController.value.text),
                              );
                            }
                          },
                          child: Text(
                            'Change Password',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
