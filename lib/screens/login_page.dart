import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_event.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/navigator_page.dart';
import 'package:flux_payments/screens/profile_page.dart';
import 'package:flux_payments/screens/register_page.dart';
import 'package:flux_payments/services/form_validator.dart';
import 'package:flux_payments/widgets/error_snackBar.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  final LoginRepository? loginRepo;
  final UserConfigRepository? userConfigRepository;
  LoginPage(
      {Key? key, @required this.loginRepo, @required this.userConfigRepository})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSubmitted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    var userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (ctx, state) {
            print("Submitted:            $isSubmitted");
            if (state is AuthError) {
              print("-------------------------AUTH ERROR===${state.message}");
              Navigator.of(ctx).pop();
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
            if (state is UserSignedInAuthState) {
              Navigator.of(ctx).pop();
              print("===++++++++++++++++++++++________________USer signed in");

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: userBloc,
                    // child: HomePage(
                    //   userRepository: widget.userConfigRepository,
                    // ),
                    //child:ProfilePage(),
                    child:NavigatorPage(userRepository: widget.userConfigRepository,),
                  ),
                ),
              );
            }
          },
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
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                          hintText: 'abc@xyz.com',
                        ),
                        validator: (s) =>
                            widget.loginRepo?.validateEmailFormField(s ?? ""),
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
                        validator: (s) {
                          return widget.loginRepo
                              ?.validatePasswordFormField(s ?? "");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: isSubmitted
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 40,
                          width: 190,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                          child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => isSubmitted
                                        ? Colors.grey
                                        : Colors.blue)),
                            onPressed: isSubmitted
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();
                                    var r = _formKey.currentState?.validate();
                                    print(r);
                                    if (r == true) {
                                      setState(() {
                                        isSubmitted = true;
                                      });
                                      print(_emailController.value.text);
                                      print(_passwordController.value.text);
                                      authBloc.add(EmailLogInUser(
                                          _emailController.value.text.trim(),
                                          _passwordController.value.text));
                                      setState(() {
                                        isSubmitted = false;
                                      });
                                    }
                                  },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                ),
              ),
              // ),
              SizedBox(
                height: 20,
              ),
              SignInButton(
                Buttons.Google,
                onPressed: () {
                  authBloc.add(SocialSignInUser(AuthProvider.google));
                },
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                Buttons.Facebook,
                onPressed: () {},
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
                              builder: (_) => BlocProvider.value(
                                value: authBloc,
                                child: RegisterPage(
                                  userConfigRepository:
                                      widget.userConfigRepository,
                                  loginRepository: widget.loginRepo,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  
  }
}
