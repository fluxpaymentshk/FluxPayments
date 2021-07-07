import 'dart:developer';

import 'package:amplify_flutter/amplify.dart';
import 'package:aws_lambda/aws_lambda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_event.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/change_password.dart';
import 'package:flux_payments/screens/login_page.dart';
import 'package:flux_payments/screens/password_reset.dart';
import 'package:flux_payments/services/database_lambda.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  final String email;
  final UserConfigRepository? userRepository;
  const HomePage({Key? key, @required this.userRepository, this.email = ""})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserConfigRepository _userConfigRepository = new UserConfigRepository();

  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Payments',
      style: optionStyle,
    ),
    Text(
      'Index 1: home',
      style: optionStyle,
    ),
    Text(
      'Index 2:gift',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var userBloc = BlocProvider.of<UserBloc>(context);
    log("EMAIL-------------------> ${widget.email}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              Map<String, dynamic> r = await _databaseLambdaService
                  .getUserRewardDetails(userID: "Flux-Monik");
              r.forEach((key, value) {
                if (key == "records") print(key + "--->" + value.toString());
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Called the lambda function"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Icon(Icons.run_circle_outlined, size: 40),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              await Amplify.Auth.signOut();
              Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 35,
                width: 220,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(1)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: userBloc,
                          // create: (_) => UserBloc(
                          //     widget.userRepository ?? _userConfigRepository),
                          child: ChangePassword(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Change Password',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              height: 35,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(1)),
              child: TextButton(
                onPressed: () {
                  userBloc.add(
                      UserResetPasswordEvent(email: widget.email, code: ""));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider(
                        create: (_) => UserBloc(
                            widget.userRepository ?? _userConfigRepository),
                        child: PasswordReset(
                          userConfigRepository: widget.userRepository,
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
