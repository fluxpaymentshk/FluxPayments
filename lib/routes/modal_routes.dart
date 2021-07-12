import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_payments/repository/login_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/login_page.dart';

class ModalRoutes {
  static late final LoginRepository loginRepo;
  static late final UserConfigRepository userConfigRepository;

  static Route<dynamic> generateroute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
            builder: (ctx) => LoginPage(
                loginRepo: loginRepo,
                userConfigRepository: userConfigRepository));
      default:
        return MaterialPageRoute(
            builder: (ctx) => LoginPage(
                loginRepo: loginRepo,
                userConfigRepository: userConfigRepository));
    }
  }
}
