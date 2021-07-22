/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
  final String? _firstName;
  final String? _lastName;
  final TemporalDate? _dateOfBirth;
  final String? _idCardNumber;
  final String? _uniqueID;
  final String? _mobileNumber;
  final String? _email;
  final int? _fluxPoints;
  final List<RewardTransaction>? _UserToRewardTransactions;
  final List<String>? _favorites;
  final List<ServiceTransaction>? _UserToServiceTransactions;
  final List<Bank>? _hasBankAccounts;
  final List<DebitCard>? _hasDebitCards;
  final List<CreditCard>? _hasCreditCard;
  final List<UserWallet>? _hasWallets;
  final String? _refreeID;
  final List<String>? _referredTo;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String get firstName {
    try {
      return _firstName!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get lastName {
    return _lastName;
  }

  TemporalDate? get dateOfBirth {
    return _dateOfBirth;
  }

  String? get idCardNumber {
    return _idCardNumber;
  }

  String get uniqueID {
    try {
      return _uniqueID!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get mobileNumber {
    return _mobileNumber;
  }

  String? get email {
    return _email;
  }

  int? get fluxPoints {
    return _fluxPoints;
  }

  List<RewardTransaction>? get UserToRewardTransactions {
    return _UserToRewardTransactions;
  }

  List<String>? get favorites {
    return _favorites;
  }

  List<ServiceTransaction>? get UserToServiceTransactions {
    return _UserToServiceTransactions;
  }

  List<Bank>? get hasBankAccounts {
    return _hasBankAccounts;
  }

  List<DebitCard>? get hasDebitCards {
    return _hasDebitCards;
  }

  List<CreditCard>? get hasCreditCard {
    return _hasCreditCard;
  }

  List<UserWallet>? get hasWallets {
    return _hasWallets;
  }

  String get refreeID {
    try {
      return _refreeID!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<String>? get referredTo {
    return _referredTo;
  }

  const User._internal(
      {required this.id,
      required firstName,
      lastName,
      dateOfBirth,
      idCardNumber,
      required uniqueID,
      mobileNumber,
      email,
      fluxPoints,
      UserToRewardTransactions,
      favorites,
      UserToServiceTransactions,
      hasBankAccounts,
      hasDebitCards,
      hasCreditCard,
      hasWallets,
      required refreeID,
      referredTo})
      : _firstName = firstName,
        _lastName = lastName,
        _dateOfBirth = dateOfBirth,
        _idCardNumber = idCardNumber,
        _uniqueID = uniqueID,
        _mobileNumber = mobileNumber,
        _email = email,
        _fluxPoints = fluxPoints,
        _UserToRewardTransactions = UserToRewardTransactions,
        _favorites = favorites,
        _UserToServiceTransactions = UserToServiceTransactions,
        _hasBankAccounts = hasBankAccounts,
        _hasDebitCards = hasDebitCards,
        _hasCreditCard = hasCreditCard,
        _hasWallets = hasWallets,
        _refreeID = refreeID,
        _referredTo = referredTo;

  factory User(
      {String? id,
      required String firstName,
      String? lastName,
      TemporalDate? dateOfBirth,
      String? idCardNumber,
      required String uniqueID,
      String? mobileNumber,
      String? email,
      int? fluxPoints,
      List<RewardTransaction>? UserToRewardTransactions,
      List<String>? favorites,
      List<ServiceTransaction>? UserToServiceTransactions,
      List<Bank>? hasBankAccounts,
      List<DebitCard>? hasDebitCards,
      List<CreditCard>? hasCreditCard,
      List<UserWallet>? hasWallets,
      required String refreeID,
      List<String>? referredTo}) {
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
            ? List<RewardTransaction>.unmodifiable(UserToRewardTransactions)
            : UserToRewardTransactions,
        favorites: favorites != null
            ? List<String>.unmodifiable(favorites)
            : favorites,
        UserToServiceTransactions: UserToServiceTransactions != null
            ? List<ServiceTransaction>.unmodifiable(UserToServiceTransactions)
            : UserToServiceTransactions,
        hasBankAccounts: hasBankAccounts != null
            ? List<Bank>.unmodifiable(hasBankAccounts)
            : hasBankAccounts,
        hasDebitCards: hasDebitCards != null
            ? List<DebitCard>.unmodifiable(hasDebitCards)
            : hasDebitCards,
        hasCreditCard: hasCreditCard != null
            ? List<CreditCard>.unmodifiable(hasCreditCard)
            : hasCreditCard,
        hasWallets: hasWallets != null
            ? List<UserWallet>.unmodifiable(hasWallets)
            : hasWallets,
        refreeID: refreeID,
        referredTo: referredTo != null
            ? List<String>.unmodifiable(referredTo)
            : referredTo);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        _firstName == other._firstName &&
        _lastName == other._lastName &&
        _dateOfBirth == other._dateOfBirth &&
        _idCardNumber == other._idCardNumber &&
        _uniqueID == other._uniqueID &&
        _mobileNumber == other._mobileNumber &&
        _email == other._email &&
        _fluxPoints == other._fluxPoints &&
        DeepCollectionEquality().equals(
            _UserToRewardTransactions, other._UserToRewardTransactions) &&
        DeepCollectionEquality().equals(_favorites, other._favorites) &&
        DeepCollectionEquality().equals(
            _UserToServiceTransactions, other._UserToServiceTransactions) &&
        DeepCollectionEquality()
            .equals(_hasBankAccounts, other._hasBankAccounts) &&
        DeepCollectionEquality().equals(_hasDebitCards, other._hasDebitCards) &&
        DeepCollectionEquality().equals(_hasCreditCard, other._hasCreditCard) &&
        DeepCollectionEquality().equals(_hasWallets, other._hasWallets) &&
        _refreeID == other._refreeID &&
        DeepCollectionEquality().equals(_referredTo, other._referredTo);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("firstName=" + "$_firstName" + ", ");
    buffer.write("lastName=" + "$_lastName" + ", ");
    buffer.write("dateOfBirth=" +
        (_dateOfBirth != null ? _dateOfBirth!.format() : "null") +
        ", ");
    buffer.write("idCardNumber=" + "$_idCardNumber" + ", ");
    buffer.write("uniqueID=" + "$_uniqueID" + ", ");
    buffer.write("mobileNumber=" + "$_mobileNumber" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("fluxPoints=" +
        (_fluxPoints != null ? _fluxPoints!.toString() : "null") +
        ", ");
    buffer.write("favorites=" +
        (_favorites != null ? _favorites!.toString() : "null") +
        ", ");
    buffer.write("refreeID=" + "$_refreeID" + ", ");
    buffer.write("referredTo=" +
        (_referredTo != null ? _referredTo!.toString() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  User copyWith(
      {String? id,
      String? firstName,
      String? lastName,
      TemporalDate? dateOfBirth,
      String? idCardNumber,
      String? uniqueID,
      String? mobileNumber,
      String? email,
      int? fluxPoints,
      List<RewardTransaction>? UserToRewardTransactions,
      List<String>? favorites,
      List<ServiceTransaction>? UserToServiceTransactions,
      List<Bank>? hasBankAccounts,
      List<DebitCard>? hasDebitCards,
      List<CreditCard>? hasCreditCard,
      List<UserWallet>? hasWallets,
      String? refreeID,
      List<String>? referredTo}) {
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
        _firstName = json['firstName'],
        _lastName = json['lastName'],
        _dateOfBirth = json['dateOfBirth'] != null
            ? TemporalDate.fromString(json['dateOfBirth'])
            : null,
        _idCardNumber = json['idCardNumber'],
        _uniqueID = json['uniqueID'],
        _mobileNumber = json['mobileNumber'],
        _email = json['email'],
        _fluxPoints = json['fluxPoints'],
        _UserToRewardTransactions = json['UserToRewardTransactions'] is List
            ? (json['UserToRewardTransactions'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => RewardTransaction.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _favorites = json['favorites']?.cast<String>(),
        _UserToServiceTransactions = json['UserToServiceTransactions'] is List
            ? (json['UserToServiceTransactions'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => ServiceTransaction.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _hasBankAccounts = json['hasBankAccounts'] is List
            ? (json['hasBankAccounts'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => Bank.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _hasDebitCards = json['hasDebitCards'] is List
            ? (json['hasDebitCards'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => DebitCard.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _hasCreditCard = json['hasCreditCard'] is List
            ? (json['hasCreditCard'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => CreditCard.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _hasWallets = json['hasWallets'] is List
            ? (json['hasWallets'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => UserWallet.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _refreeID = json['refreeID'],
        _referredTo = json['referredTo']?.cast<String>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': _firstName,
        'lastName': _lastName,
        'dateOfBirth': _dateOfBirth?.format(),
        'idCardNumber': _idCardNumber,
        'uniqueID': _uniqueID,
        'mobileNumber': _mobileNumber,
        'email': _email,
        'fluxPoints': _fluxPoints,
        'UserToRewardTransactions':
            _UserToRewardTransactions?.map((e) => e?.toJson())?.toList(),
        'favorites': _favorites,
        'UserToServiceTransactions':
            _UserToServiceTransactions?.map((e) => e?.toJson())?.toList(),
        'hasBankAccounts': _hasBankAccounts?.map((e) => e?.toJson())?.toList(),
        'hasDebitCards': _hasDebitCards?.map((e) => e?.toJson())?.toList(),
        'hasCreditCard': _hasCreditCard?.map((e) => e?.toJson())?.toList(),
        'hasWallets': _hasWallets?.map((e) => e?.toJson())?.toList(),
        'refreeID': _refreeID,
        'referredTo': _referredTo
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
