import 'package:flux_payments/models/Cards.dart';

abstract class CardsState {
  const CardsState();
}

class CardsInitialState extends CardsState {
  const CardsInitialState();
}

class LoadingCards extends CardsState {
  const LoadingCards();
}

class LoadedCards extends CardsState {
  final List<Cards>? cards;
  const LoadedCards({this.cards});
}

class UpdatingCards extends CardsState {
  const UpdatingCards();
}

class UpdatedCards extends CardsState {
  const UpdatedCards();
}

class ErrorCards extends CardsState {
  final String? message;
  const ErrorCards(this.message);
}
