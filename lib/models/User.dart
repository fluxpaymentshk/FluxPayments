// @dart=2.9
/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// ignore_for_file: public_member_api_docs

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String firstName;
  final String lastName;
  final TemporalDate dateOfBirth;
  final String idCardNumber;
  final String uniqueID;
  final String mobileNumber;
  final String email;
  final int fluxPoints;
  final List<RewardTransaction> UserToRewardTransactions;
  final List<String> favorites;
  final List<ServiceTransaction> UserToServiceTransactions;
  final List<Bank> hasBankAccounts;
  final List<DebitCard> hasDebitCards;
  final List<CreditCard> hasCreditCard;
  final List<UserWallet> hasWallets;
  final String refreeID;
  final List<String> referredTo;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const User._internal(
      {@required this.id,
      @required this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.idCardNumber,
      @required this.uniqueID,
      this.mobileNumber,
      this.email,
      this.fluxPoints,
      this.UserToRewardTransactions,
      this.favorites,
      this.UserToServiceTransactions,
      this.hasBankAccounts,
      this.hasDebitCards,
      this.hasCreditCard,
      this.hasWallets,
      @required this.refreeID,
      this.referredTo});

  factory User(
      {String id,
      @required String firstName,
      String lastName,
      TemporalDate dateOfBirth,
      String idCardNumber,
      @required String uniqueID,
      String mobileNumber,
      String email,
      int fluxPoints,
      List<RewardTransaction> UserToRewardTransactions,
      List<String> favorites,
      List<ServiceTransaction> UserToServiceTransactions,
      List<Bank> hasBankAccounts,
      List<DebitCard> hasDebitCards,
      List<CreditCard> hasCreditCard,
      List<UserWallet> hasWallets,
      @required String refreeID,
      List<String> referredTo}) {
    return User._internal(
        id: id == null ? UUID.getUUID() : id,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        idCardNumber: idCardNumber,
        uniqueID: uniqueID,
        mobileNumber: mobileNumber,
        email: email,
        fluxPoints: fluxPoints,
        UserToRewardTransactions: UserToRewardTransactions != null
            ? List.unmodifiable(UserToRewardTransactions)
            : UserToRewardTransactions,
        favorites: favorites != null ? List.unmodifiable(favorites) : favorites,
        UserToServiceTransactions: UserToServiceTransactions != null
            ? List.unmodifiable(UserToServiceTransactions)
            : UserToServiceTransactions,
        hasBankAccounts: hasBankAccounts != null
            ? List.unmodifiable(hasBankAccounts)
            : hasBankAccounts,
        hasDebitCards: hasDebitCards != null
            ? List.unmodifiable(hasDebitCards)
            : hasDebitCards,
        hasCreditCard: hasCreditCard != null
            ? List.unmodifiable(hasCreditCard)
            : hasCreditCard,
        hasWallets:
            hasWallets != null ? List.unmodifiable(hasWallets) : hasWallets,
        refreeID: refreeID,
        referredTo:
            referredTo != null ? List.unmodifiable(referredTo) : referredTo);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        dateOfBirth == other.dateOfBirth &&
        idCardNumber == other.idCardNumber &&
        uniqueID == other.uniqueID &&
        mobileNumber == other.mobileNumber &&
        email == other.email &&
        fluxPoints == other.fluxPoints &&
        DeepCollectionEquality()
            .equals(UserToRewardTransactions, other.UserToRewardTransactions) &&
        DeepCollectionEquality().equals(favorites, other.favorites) &&
        DeepCollectionEquality().equals(
            UserToServiceTransactions, other.UserToServiceTransactions) &&
        DeepCollectionEquality()
            .equals(hasBankAccounts, other.hasBankAccounts) &&
        DeepCollectionEquality().equals(hasDebitCards, other.hasDebitCards) &&
        DeepCollectionEquality().equals(hasCreditCard, other.hasCreditCard) &&
        DeepCollectionEquality().equals(hasWallets, other.hasWallets) &&
        refreeID == other.refreeID &&
        DeepCollectionEquality().equals(referredTo, other.referredTo);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("firstName=" + "$firstName" + ", ");
    buffer.write("lastName=" + "$lastName" + ", ");
    buffer.write("dateOfBirth=" +
        (dateOfBirth != null ? dateOfBirth.format() : "null") +
        ", ");
    buffer.write("idCardNumber=" + "$idCardNumber" + ", ");
    buffer.write("uniqueID=" + "$uniqueID" + ", ");
    buffer.write("mobileNumber=" + "$mobileNumber" + ", ");
    buffer.write("email=" + "$email" + ", ");
    buffer.write("fluxPoints=" +
        (fluxPoints != null ? fluxPoints.toString() : "null") +
        ", ");
    buffer.write("favorites=" +
        (favorites != null ? favorites.toString() : "null") +
        ", ");
    buffer.write("refreeID=" + "$refreeID" + ", ");
    buffer.write(
        "referredTo=" + (referredTo != null ? referredTo.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String id,
      String firstName,
      String lastName,
      TemporalDate dateOfBirth,
      String idCardNumber,
      String uniqueID,
      String mobileNumber,
      String email,
      int fluxPoints,
      List<RewardTransaction> UserToRewardTransactions,
      List<String> favorites,
      List<ServiceTransaction> UserToServiceTransactions,
      List<Bank> hasBankAccounts,
      List<DebitCard> hasDebitCards,
      List<CreditCard> hasCreditCard,
      List<UserWallet> hasWallets,
      String refreeID,
      List<String> referredTo}) {
    return User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        idCardNumber: idCardNumber ?? this.idCardNumber,
        uniqueID: uniqueID ?? this.uniqueID,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        fluxPoints: fluxPoints ?? this.fluxPoints,
        UserToRewardTransactions:
            UserToRewardTransactions ?? this.UserToRewardTransactions,
        favorites: favorites ?? this.favorites,
        UserToServiceTransactions:
            UserToServiceTransactions ?? this.UserToServiceTransactions,
        hasBankAccounts: hasBankAccounts ?? this.hasBankAccounts,
        hasDebitCards: hasDebitCards ?? this.hasDebitCards,
        hasCreditCard: hasCreditCard ?? this.hasCreditCard,
        hasWallets: hasWallets ?? this.hasWallets,
        refreeID: refreeID ?? this.refreeID,
        referredTo: referredTo ?? this.referredTo);
  }

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        dateOfBirth = json['dateOfBirth'] != null
            ? TemporalDate.fromString(json['dateOfBirth'])
            : null,
        idCardNumber = json['idCardNumber'],
        uniqueID = json['uniqueID'],
        mobileNumber = json['mobileNumber'],
        email = json['email'],
        fluxPoints = json['fluxPoints'],
        UserToRewardTransactions = json['UserToRewardTransactions'] is List
            ? (json['UserToRewardTransactions'] as List)
                .map((e) => RewardTransaction.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        favorites = json['favorites']?.cast<String>(),
        UserToServiceTransactions = json['UserToServiceTransactions'] is List
            ? (json['UserToServiceTransactions'] as List)
                .map((e) => ServiceTransaction.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        hasBankAccounts = json['hasBankAccounts'] is List
            ? (json['hasBankAccounts'] as List)
                .map((e) => Bank.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        hasDebitCards = json['hasDebitCards'] is List
            ? (json['hasDebitCards'] as List)
                .map(
                    (e) => DebitCard.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        hasCreditCard = json['hasCreditCard'] is List
            ? (json['hasCreditCard'] as List)
                .map((e) =>
                    CreditCard.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        hasWallets = json['hasWallets'] is List
            ? (json['hasWallets'] as List)
                .map((e) =>
                    UserWallet.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        refreeID = json['refreeID'],
        referredTo = json['referredTo']?.cast<String>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'dateOfBirth': dateOfBirth?.format(),
        'idCardNumber': idCardNumber,
        'uniqueID': uniqueID,
        'mobileNumber': mobileNumber,
        'email': email,
        'fluxPoints': fluxPoints,
        'UserToRewardTransactions':
            UserToRewardTransactions?.map((e) => e?.toJson())?.toList(),
        'favorites': favorites,
        'UserToServiceTransactions':
            UserToServiceTransactions?.map((e) => e?.toJson())?.toList(),
        'hasBankAccounts': hasBankAccounts?.map((e) => e?.toJson())?.toList(),
        'hasDebitCards': hasDebitCards?.map((e) => e?.toJson())?.toList(),
        'hasCreditCard': hasCreditCard?.map((e) => e?.toJson())?.toList(),
        'hasWallets': hasWallets?.map((e) => e?.toJson())?.toList(),
        'refreeID': refreeID,
        'referredTo': referredTo
      };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField FIRSTNAME = QueryField(fieldName: "firstName");
  static final QueryField LASTNAME = QueryField(fieldName: "lastName");
  static final QueryField DATEOFBIRTH = QueryField(fieldName: "dateOfBirth");
  static final QueryField IDCARDNUMBER = QueryField(fieldName: "idCardNumber");
  static final QueryField UNIQUEID = QueryField(fieldName: "uniqueID");
  static final QueryField MOBILENUMBER = QueryField(fieldName: "mobileNumber");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField FLUXPOINTS = QueryField(fieldName: "fluxPoints");
  static final QueryField USERTOREWARDTRANSACTIONS = QueryField(
      fieldName: "UserToRewardTransactions",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static final QueryField FAVORITES = QueryField(fieldName: "favorites");
  static final QueryField USERTOSERVICETRANSACTIONS = QueryField(
      fieldName: "UserToServiceTransactions",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ServiceTransaction).toString()));
  static final QueryField HASBANKACCOUNTS = QueryField(
      fieldName: "hasBankAccounts",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Bank).toString()));
  static final QueryField HASDEBITCARDS = QueryField(
      fieldName: "hasDebitCards",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (DebitCard).toString()));
  static final QueryField HASCREDITCARD = QueryField(
      fieldName: "hasCreditCard",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (CreditCard).toString()));
  static final QueryField HASWALLETS = QueryField(
      fieldName: "hasWallets",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserWallet).toString()));
  static final QueryField REFREEID = QueryField(fieldName: "refreeID");
  static final QueryField REFERREDTO = QueryField(fieldName: "referredTo");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";

    modelSchemaDefinition.authRules = [
      AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
        ModelOperation.CREATE,
        ModelOperation.UPDATE,
        ModelOperation.DELETE,
        ModelOperation.READ
      ])
    ];

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.FIRSTNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.LASTNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.DATEOFBIRTH,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.IDCARDNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.UNIQUEID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.MOBILENUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.EMAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.FLUXPOINTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.USERTOREWARDTRANSACTIONS,
        isRequired: false,
        ofModelName: (RewardTransaction).toString(),
        associatedKey: RewardTransaction.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.FAVORITES,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.string))));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.USERTOSERVICETRANSACTIONS,
        isRequired: false,
        ofModelName: (ServiceTransaction).toString(),
        associatedKey: ServiceTransaction.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.HASBANKACCOUNTS,
        isRequired: false,
        ofModelName: (Bank).toString(),
        associatedKey: Bank.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.HASDEBITCARDS,
        isRequired: false,
        ofModelName: (DebitCard).toString(),
        associatedKey: DebitCard.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.HASCREDITCARD,
        isRequired: false,
        ofModelName: (CreditCard).toString(),
        associatedKey: CreditCard.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: User.HASWALLETS,
        isRequired: false,
        ofModelName: (UserWallet).toString(),
        associatedKey: UserWallet.USERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.REFREEID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: User.REFERREDTO,
        isRequired: false,
        isArray: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.collection,
            ofModelName: describeEnum(ModelFieldTypeEnum.string))));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
