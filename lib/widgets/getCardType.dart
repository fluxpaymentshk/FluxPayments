
import 'package:flutter_credit_card/credit_card_widget.dart';

CardType getCardType(String? cardBrand) {
  switch (cardBrand) {
    case "amex":
      return CardType.americanExpress;
    case "visa":
      return CardType.visa;
    case "mastercard":
      return CardType.mastercard;
    default:
      return CardType.otherBrand;
  }
}