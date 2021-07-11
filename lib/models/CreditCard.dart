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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the CreditCard type in your schema. */
@immutable
class CreditCard extends Model {
  static const classType = const _CreditCardModelType();
  final String id;
  final int? _creditCardNumber;
  final TemporalDate? _expiryDate;
  final String? _bankName;
  final int? _cvv;
  final String? _name;
  final String? _userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  int? get creditCardNumber {
    return _creditCardNumber;
  }

  TemporalDate? get expiryDate {
    return _expiryDate;
  }

  String? get bankName {
    return _bankName;
  }

  int? get cvv {
    return _cvv;
  }

  String? get name {
    return _name;
  }

  String? get userID {
    return _userID;
  }

  const CreditCard._internal(
      {required this.id,
      creditCardNumber,
      expiryDate,
      bankName,
      cvv,
      name,
      userID})
      : _creditCardNumber = creditCardNumber,
        _expiryDate = expiryDate,
        _bankName = bankName,
        _cvv = cvv,
        _name = name,
        _userID = userID;

  factory CreditCard(
      {String? id,
      int? creditCardNumber,
      TemporalDate? expiryDate,
      String? bankName,
      int? cvv,
      String? name,
      String? userID}) {
    return CreditCard._internal(
        id: id == null ? UUID.getUUID() : id,
        creditCardNumber: creditCardNumber,
        expiryDate: expiryDate,
        bankName: bankName,
        cvv: cvv,
        name: name,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreditCard &&
        id == other.id &&
        _creditCardNumber == other._creditCardNumber &&
        _expiryDate == other._expiryDate &&
        _bankName == other._bankName &&
        _cvv == other._cvv &&
        _name == other._name &&
        _userID == other._userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("CreditCard {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("creditCardNumber=" +
        (_creditCardNumber != null ? _creditCardNumber!.toString() : "null") +
        ", ");
    buffer.write("expiryDate=" +
        (_expiryDate != null ? _expiryDate!.format() : "null") +
        ", ");
    buffer.write("bankName=" + "$_bankName" + ", ");
    buffer.write("cvv=" + (_cvv != null ? _cvv!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");

    return buffer.toString();
  }

  CreditCard copyWith(
      {String? id,
      int? creditCardNumber,
      TemporalDate? expiryDate,
      String? bankName,
      int? cvv,
      String? name,
      String? userID}) {
    return CreditCard(
        id: id ?? this.id,
        creditCardNumber: creditCardNumber ?? this.creditCardNumber,
        expiryDate: expiryDate ?? this.expiryDate,
        bankName: bankName ?? this.bankName,
        cvv: cvv ?? this.cvv,
        name: name ?? this.name,
        userID: userID ?? this.userID);
  }

  CreditCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _creditCardNumber = json['creditCardNumber'],
        _expiryDate = json['expiryDate'] != null
            ? TemporalDate.fromString(json['expiryDate'])
            : null,
        _bankName = json['bankName'],
        _cvv = json['cvv'],
        _name = json['name'],
        _userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'creditCardNumber': _creditCardNumber,
        'expiryDate': _expiryDate?.format(),
        'bankName': _bankName,
        'cvv': _cvv,
        'name': _name,
        'userID': _userID
      };

  static final QueryField ID = QueryField(fieldName: "creditCard.id");
  static final QueryField CREDITCARDNUMBER =
      QueryField(fieldName: "creditCardNumber");
  static final QueryField EXPIRYDATE = QueryField(fieldName: "expiryDate");
  static final QueryField BANKNAME = QueryField(fieldName: "bankName");
  static final QueryField CVV = QueryField(fieldName: "cvv");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "CreditCard";
    modelSchemaDefinition.pluralName = "CreditCards";

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
        key: CreditCard.CREDITCARDNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CreditCard.EXPIRYDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CreditCard.BANKNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CreditCard.CVV,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CreditCard.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: CreditCard.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _CreditCardModelType extends ModelType<CreditCard> {
  const _CreditCardModelType();

  @override
  CreditCard fromJson(Map<String, dynamic> jsonData) {
    return CreditCard.fromJson(jsonData);
  }
}
