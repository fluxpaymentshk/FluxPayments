import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';

class Cards extends Model {
  static const classType = const _CardsModelType();
  final double? cardID;
  final String? cardNumber;
  final String? expiryDate;
  final String? bankName;
  final double? cvv;
  final String? holderName;
  final String? userID;
  final String? cardBrand;

  Cards({
    this.cardID,
    this.cardNumber,
    this.expiryDate,
    this.bankName,
    this.cvv,
    this.holderName,
    this.userID,
    this.cardBrand,
  });

  Cards.fromJson(Map<String, dynamic> json)
      : cardID = json["cardID"],
        cardNumber = json["cardNumber"],
        expiryDate = json["expiryDate"],
        bankName = json["bankName"],
        cvv = json["cvv"],
        userID = json["userID"],
        holderName = json["holderName"],
        cardBrand=json["cardBrand"];

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return cardID.toString();
  }

  @override
  Map<String, dynamic> toJson() => {
        "cardID": cardID,
        "cardNumber": cardNumber,
        "expiryDate": expiryDate,
        "bankName": bankName,
        "cvv": cvv,
        "userID": userID,
        "holderName": holderName,
        "cardBrand":cardBrand,
      };
}

// ignore: unused_element
class _CardsModelType extends ModelType<Cards> {
  const _CardsModelType();

  @override
  Cards fromJson(Map<String, dynamic> jsonData) {
    return Cards.fromJson(jsonData);
  }
}
