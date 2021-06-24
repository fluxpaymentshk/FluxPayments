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
  final List<Service> UserToServices;

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
      this.UserToServices});

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
      List<Service> UserToServices}) {
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
        UserToServices: UserToServices != null
            ? List.unmodifiable(UserToServices)
            : UserToServices);
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
        DeepCollectionEquality().equals(UserToServices, other.UserToServices);
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
    buffer.write(
        "favorites=" + (favorites != null ? favorites.toString() : "null"));
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
      List<Service> UserToServices}) {
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
        UserToServices: UserToServices ?? this.UserToServices);
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
        UserToServices = json['UserToServices'] is List
            ? (json['UserToServices'] as List)
                .map((e) => Service.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

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
        'UserToServices': UserToServices?.map((e) => e?.toJson())?.toList()
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
  static final QueryField USERTOSERVICES = QueryField(
      fieldName: "UserToServices",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Service).toString()));
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
        key: User.USERTOSERVICES,
        isRequired: false,
        ofModelName: (Service).toString(),
        associatedKey: Service.USERID));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();

  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}
