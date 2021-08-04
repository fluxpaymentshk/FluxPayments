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

/** This is an auto generated class representing the Bank type in your schema. */
@immutable
class Bank extends Model {
  static const classType = const _BankModelType();
  final String id;
  final String? _accNumber;
  final String? _bankName;
  final String? _ifscCode;
  final String? _accHolderName;
  final String? _userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get accNumber {
    return _accNumber;
  }

  String? get bankName {
    return _bankName;
  }

  String? get ifscCode {
    return _ifscCode;
  }

  String? get accHolderName {
    return _accHolderName;
  }

  String? get userID {
    return _userID;
  }

  const Bank._internal(
      {required this.id, accNumber, bankName, ifscCode, accHolderName, userID})
      : _accNumber = accNumber,
        _bankName = bankName,
        _ifscCode = ifscCode,
        _accHolderName = accHolderName,
        _userID = userID;

  factory Bank(
      {String? id,
      String? accNumber,
      String? bankName,
      String? ifscCode,
      String? accHolderName,
      String? userID}) {
    return Bank._internal(
        id: id == null ? UUID.getUUID() : id,
        accNumber: accNumber,
        bankName: bankName,
        ifscCode: ifscCode,
        accHolderName: accHolderName,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Bank &&
        id == other.id &&
        _accNumber == other._accNumber &&
        _bankName == other._bankName &&
        _ifscCode == other._ifscCode &&
        _accHolderName == other._accHolderName &&
        _userID == other._userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Bank {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("accNumber=" +
        (_accNumber != null ? _accNumber!.toString() : "null") +
        ", ");
    buffer.write("bankName=" + "$_bankName" + ", ");
    buffer.write("ifscCode=" + "$_ifscCode" + ", ");
    buffer.write("accHolderName=" + "$_accHolderName" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");

    return buffer.toString();
  }

  Bank copyWith(
      {String? id,
      String? accNumber,
      String? bankName,
      String? ifscCode,
      String? accHolderName,
      String? userID}) {
    return Bank(
        id: id ?? this.id,
        accNumber: accNumber ?? this.accNumber,
        bankName: bankName ?? this.bankName,
        ifscCode: ifscCode ?? this.ifscCode,
        accHolderName: accHolderName ?? this.accHolderName,
        userID: userID ?? this.userID);
  }

  Bank.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _accNumber = json['accNumber'],
        _bankName = json['bankName'],
        _ifscCode = json['ifscCode'],
        _accHolderName = json['accHolderName'],
        _userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'accNumber': _accNumber,
        'bankName': _bankName,
        'ifscCode': _ifscCode,
        'accHolderName': _accHolderName,
        'userID': _userID
      };

  static final QueryField ID = QueryField(fieldName: "bank.id");
  static final QueryField ACCNUMBER = QueryField(fieldName: "accNumber");
  static final QueryField BANKNAME = QueryField(fieldName: "bankName");
  static final QueryField IFSCCODE = QueryField(fieldName: "ifscCode");
  static final QueryField ACCHOLDERNAME =
      QueryField(fieldName: "accHolderName");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Bank";
    modelSchemaDefinition.pluralName = "Banks";

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
        key: Bank.ACCNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Bank.BANKNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Bank.IFSCCODE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Bank.ACCHOLDERNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Bank.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _BankModelType extends ModelType<Bank> {
  const _BankModelType();

  @override
  Bank fromJson(Map<String, dynamic> jsonData) {
    return Bank.fromJson(jsonData);
  }
}
