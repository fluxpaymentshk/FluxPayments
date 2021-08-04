import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flux_payments/bloc/bank_bloc/bank_event.dart';
import 'package:flux_payments/bloc/bank_bloc/bank_state.dart';
import 'package:flux_payments/models/Bank.dart';
import 'package:flux_payments/repository/database_repository.dart';

class BanksBloc extends Bloc<BanksEvent, BanksState> {
  final DatabaseRepository _databaseRepo;
  BanksBloc(this._databaseRepo) : super(BanksInitialState());
  List<Bank> banks = [];

  @override
  Stream<BanksState> mapEventToState(BanksEvent event) async* {
    yield BanksInitialState();
    if (event is GetBanks) {
      try {
        yield LoadingBanks();
        try {
          log("${event.userID}");
          banks = await _databaseRepo.getUserBanks(userID: event.userID);
          yield LoadedBanks(banks: banks);
        } catch (e) {
          yield ErrorBanks("Unable to load Banks!");
        }
      } catch (e) {
        yield ErrorBanks("Unable to load Banks!");
      }
    }
  }
}
