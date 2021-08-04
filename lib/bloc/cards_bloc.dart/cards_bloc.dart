import 'dart:developer';

import 'package:flux_payments/bloc/cards_bloc.dart/cards_event.dart';
import 'package:flux_payments/bloc/cards_bloc.dart/cards_state.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_event.dart';
import 'package:flux_payments/bloc/flux_points_bloc/flux_point_state.dart';
import 'package:flux_payments/models/Cards.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:flux_payments/services/database_lambda.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  final DatabaseRepository _databaseRepo;
  CardsBloc(this._databaseRepo) : super(CardsInitialState());
  List<Cards> cards = [];

  @override
  Stream<CardsState> mapEventToState(CardsEvent event) async* {
    yield CardsInitialState();
    if (event is GetCards) {
      try {
        yield LoadingCards();
        try {
          log("${event.userID}");
          cards = await _databaseRepo.getUserCards(userID: event.userID);
          yield LoadedCards(cards: cards);
          log("Suuccessss");
        } catch (e) {
          yield ErrorCards("Unable to load Cards!");
        }
      } catch (e) {
        yield ErrorCards("Unable to load Cards!");
      }
    } else if (event is AddCard) {
      yield UpdatingCards();
      try {
        await _databaseRepo.addNewCard(
          userID: event.userID,
          expiryDate: event.expiryDate,
          cardNumber: event.cardNumber,
          cvv: event.cvv,
          holderName: event.holderName,
        );
        yield UpdatedCards();
      } catch (e) {
        yield ErrorCards("not able to update card");
      }
    }
  }
}
