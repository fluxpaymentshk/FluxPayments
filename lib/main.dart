//@dart=2.9
import 'dart:async';
import 'dart:developer';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/amplifyconfiguration.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_bloc.dart';
import 'package:flux_payments/bloc/auth_bloc/auth_state.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/home_page.dart';
import 'package:flux_payments/screens/login_page.dart';
import 'package:flux_payments/routes/modal_routes.dart';
import 'package:flux_payments/screens/navigator_page.dart';
// import 'package:dart_mssql/dart_mssql.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginRepository _loginRepository = new LoginRepository();
  UserConfigRepository _userConfigRepository = new UserConfigRepository();

  bool _amplifyConfigured = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
    ModalRoutes.loginRepo = _loginRepository;
    ModalRoutes.userConfigRepository = _userConfigRepository;
  }

  void _configureAmplify() async {
    if (!mounted) return;
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Map<String, String> userDetails = {};
  Future<void> checkUserDetail() async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        userDetails[element.userAttributeKey] = element.value;
        String email = "";
        // l?.forEach((element) {
        if (element.userAttributeKey == "email") {
          print("--------${element.value}");
          email = element.value;
        }
      });
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<bool> currentUser(context) async {
    var emailLoginBloc = BlocProvider.of<AuthBloc>(context);
    isSignedIn = await emailLoginBloc.currentUser;

    return isSignedIn;
  }

  var authBloc;
  var userBloc;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flux Payments',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthBloc(_loginRepository),
          ),
          BlocProvider(
            create: (_) => UserBloc(_userConfigRepository),
          ),
        ],
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (prevSt, newSt) {
            return !(prevSt is UserSignedInAuthState) && newSt is AuthInitial;
          },
          builder: (ctx, st) {
            log(_amplifyConfigured.toString());
            log("Sign?:$isSignedIn");
            return (!_amplifyConfigured)
                ? Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : FutureBuilder<bool>(
                    future: currentUser(ctx),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data == false)
                        return LoginPage(
                          loginRepo: _loginRepository,
                          userConfigRepository: _userConfigRepository,
                        );
                      return NavigatorPage(
                          userRepository: _userConfigRepository);
                    });
          },
        ),
      ),
      routes: {
        LoginPage.routeName: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (_) => AuthBloc(_loginRepository),
                ),
                BlocProvider(create: (_) => UserBloc(_userConfigRepository)),
              ],
              child: LoginPage(
                loginRepo: _loginRepository,
                userConfigRepository: _userConfigRepository,
              ),
            ),
        HomePage.routeName: (_) => BlocProvider<UserBloc>(
              create: (_) => UserBloc(_userConfigRepository),
              child: HomePage(
                  userRepository: _userConfigRepository,
                  email: userDetails["email"] ?? ""),
            ),
      },
    );
  }
}
