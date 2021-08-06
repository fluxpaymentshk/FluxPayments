import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/bloc/user_bloc/user_state.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/services/user_details_services.dart';
import 'package:flux_payments/widgets/back_button.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:flux_payments/widgets/flux_logo.dart';
import 'package:flux_payments/widgets/gradient_button.dart';
import 'package:flux_payments/widgets/success_snackBar.dart';
import 'package:google_fonts/google_fonts.dart';

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
      floatingActionButton: backButton(context, "changePasswordPage"),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: BlocListener<UserBloc, UserState>(
        listener: (ctx, state) {
          if (state is UserServiceError) {
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(errorSnackBar(state.message));
          }
          if (state is UserChangePasswordDone) {
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(ctx).showSnackBar(successSnackBar("success"));
          }
          if (state is UserServiceLoading) {
            showDialog(
                context: ctx,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                });
          }
        },
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            fluxLogo(context),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Change Password",
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Form(
              key: _changePasswordFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _oldPasswordController,
                      obscureText: true,
                      cursorColor: AppTheme.main,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'Old Password',
                        hintText: '******',
                      ),
                      validator: (s) =>
                          _loginRepository.validatePasswordFormField(s ?? ""),
                    ),

                    // )
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: AppTheme.main,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'New Password',
                        hintText: '******',
                      ),
                      validator: (s) =>
                          _loginRepository.validatePasswordFormField(s ?? ""),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      cursorColor: AppTheme.main,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.main)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.main,
                          ),
                        ),
                        labelText: 'Confirm Password',
                        hintText: '******',
                      ),
                      validator: (s) =>
                          _loginRepository.validateConfirmPasswordFormField(
                              _confirmPasswordController.value.text,
                              _passwordController.value.text),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  bool? r = _changePasswordFormKey.currentState?.validate();
                  if (r == true) {
                    userBloc.add(
                      UserChangePasswordEvent(
                          oldPassword: _oldPasswordController.value.text,
                          newPassword: _passwordController.value.text),
                    );
                  }
                },
                child: gradientButton(
                  context,
                  'Change Password',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
