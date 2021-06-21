import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_event.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/signUp_otp_screen.dart';
import 'package:flux_payments/screens/login_page.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  final LoginRepository? loginRepository;
  final UserConfigRepository? userConfigRepository;
  RegisterPage(
      {Key? key,
      @required this.loginRepository,
      @required this.userConfigRepository})
      : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();
  String? phnNumber = "";
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController =
      new TextEditingController();
  final TextEditingController _phnController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('RegistPage'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Id',
                        hintText: 'abc@xyz.com',
                      ),
                      validator: (s) => widget.loginRepository
                          ?.validateEmailFormField(s ?? ""),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: '******',
                      ),
                      validator: (s) => widget.loginRepository
                          ?.validatePasswordFormField(s ?? ""),
                    ),
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
                      validator: (s) => widget.loginRepository
                          ?.validateConfirmPasswordFormField(
                              _confirmPasswordController.value.text,
                              _passwordController.value.text),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                      validator: (s) =>
                          widget.loginRepository?.validateField(s ?? ""),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InternationalPhoneNumberInput(
                      validator: (s) =>
                          widget.loginRepository?.validateField(s ?? ""),
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                        setState(() {
                          phnNumber = number.phoneNumber;
                        });
                        log(phnNumber.toString());
                      },
                      onInputValidated: (bool value) {
                        print(value);
                        log(phnNumber.toString());
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      textFieldController: _phnController,
                      formatInput: false,
                      keyboardType: TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //SizedBox(width:200, ),
            Align(
              alignment: Alignment.centerLeft,
              child: BlocListener<AuthBloc, AuthState>(
                listener: (ctx, state) {
                  if (state is AuthError) {
                    Navigator.of(ctx).pop();
                    print(
                        "-------------------------AUTH ERROR===${state.message}");
                    ScaffoldMessenger.of(ctx)
                        .showSnackBar(errorSnackBar(state.message));
                  }
                  if (state is AuthStateLoading) {
                    showDialog(
                        context: ctx,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                  }
                  if (state is AuthInitial) {
                    print("-++++AUTH INITIAL");
                  }
                  if (state is UserSignedUpAuthState) {
                    Navigator.of(ctx).pop();
                    print("===++++________________USer signed in");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                              value: authBloc,
                              child: Scaffold(
                                body: SignUpOTPScreen(
                                  email: _emailController.value.text.trim(),
                                  password: _passwordController.value.text,
                                ),
                              ),
                            )));
                    if (state is UserSignedInAuthState) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: authBloc,
                            child: HomePage(
                              userRepository: widget.userConfigRepository,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 40,
                    width: 190,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        var r = _registerFormKey.currentState?.validate();
                        if (r == true) {
                          authBloc.add(
                            EmailSignUpUser(
                              email: _emailController.value.text.trim(),
                              password: _passwordController.value.text,
                              phnNumber: phnNumber,
                              name: _nameController.value.text,
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 35,
                  width: 220,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(1)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => LoginPage(
                                    loginRepo: widget.loginRepository,
                                    userConfigRepository:
                                        widget.userConfigRepository,
                                  )));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
