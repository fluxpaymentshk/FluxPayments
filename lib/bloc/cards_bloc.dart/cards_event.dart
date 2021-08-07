import 'package:flutter/foundation.dart';

abstract class CardsEvent {
  const CardsEvent();
}

class GetCards extends CardsEvent {
  final String? userID;
  const GetCards({@required this.userID});
}

class AddCard extends CardsEvent {
  final String? userID;
  final String? expiryDate;
  final String? cardNumber;
  final String? cvv;
  final String? holderName;
  const AddCard(
      {@required this.userID,
      @required this.expiryDate,
      @required this.cardNumber,
      @required this.cvv,
      @required this.holderName});
}
