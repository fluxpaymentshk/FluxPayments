import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_bloc.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_bloc.dart';
import 'package:flux_payments/bloc/user_bloc/user_bloc.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:flux_payments/repository/user_config_repository.dart';
import 'package:flux_payments/screens/payment_Screens/pay_now_screen.dart';

class PaymentScreen extends StatelessWidget {
  final String? uid;
  final String? userName;
  final DatabaseRepository? databaseRepository;
  final UserConfigRepository? userConfigRepository;
  const PaymentScreen(
      {Key? key,
      @required this.uid,
      @required this.userName,
      @required this.databaseRepository,
      @required this.userConfigRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PaymentBloc(databaseRepository!),
        ),
        BlocProvider(
          create: (_) => UserBloc(
            userConfigRepository!,
            databaseRepository!,
          ),
        ),
        BlocProvider(
          create: (_) => CardsBloc(databaseRepository!),
        ),
      ],
      child: PayNowScreen(
        uid: uid,
        databaseRepository: databaseRepository,
        userName: userName,
      ),
    );
  }
}
