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

/** This is an auto generated class representing the DebitCard type in your schema. */
@immutable
class DebitCard extends Model {
  static const classType = const _DebitCardModelType();
  final String id;
  final int debitCardNumber;
  final TemporalDate expiryDate;
  final String bankName;
  final int cvv;
  final String name;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const DebitCard._internal(
      {@required this.id,
      this.debitCardNumber,
      this.expiryDate,
      this.bankName,
      this.cvv,
      this.name,
      this.userID});

  factory DebitCard(
      {String id,
      int debitCardNumber,
      TemporalDate expiryDate,
      String bankName,
      int cvv,
      String name,
      String userID}) {
    return DebitCard._internal(
        id: id == null ? UUID.getUUID() : id,
        debitCardNumber: debitCardNumber,
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
    return other is DebitCard &&
        id == other.id &&
        debitCardNumber == other.debitCardNumber &&
        expiryDate == other.expiryDate &&
        bankName == other.bankName &&
        cvv == other.cvv &&
        name == other.name &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("DebitCard {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("debitCardNumber=" +
        (debitCardNumber != null ? debitCardNumber.toString() : "null") +
        ", ");
    buffer.write("expiryDate=" +
        (expiryDate != null ? expiryDate.format() : "null") +
        ", ");
    buffer.write("bankName=" + "$bankName" + ", ");
    buffer.write("cvv=" + (cvv != null ? cvv.toString() : "null") + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  DebitCard copyWith(
      {String id,
      int debitCardNumber,
      TemporalDate expiryDate,
      String bankName,
      int cvv,
      String name,
      String userID}) {
    return DebitCard(
        id: id ?? this.id,
        debitCardNumber: debitCardNumber ?? this.debitCardNumber,
        expiryDate: expiryDate ?? this.expiryDate,
        bankName: bankName ?? this.bankName,
        cvv: cvv ?? this.cvv,
        name: name ?? this.name,
        userID: userID ?? this.userID);
  }

  DebitCard.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        debitCardNumber = json['debitCardNumber'],
        expiryDate = json['expiryDate'] != null
            ? TemporalDate.fromString(json['expiryDate'])
            : null,
        bankName = json['bankName'],
        cvv = json['cvv'],
        name = json['name'],
        userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'debitCardNumber': debitCardNumber,
        'expiryDate': expiryDate?.format(),
        'bankName': bankName,
        'cvv': cvv,
        'name': name,
        'userID': userID
      };

  static final QueryField ID = QueryField(fieldName: "debitCard.id");
  static final QueryField DEBITCARDNUMBER =
      QueryField(fieldName: "debitCardNumber");
  static final QueryField EXPIRYDATE = QueryField(fieldName: "expiryDate");
  static final QueryField BANKNAME = QueryField(fieldName: "bankName");
  static final QueryField CVV = QueryField(fieldName: "cvv");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "DebitCard";
    modelSchemaDefinition.pluralName = "DebitCards";

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
        key: DebitCard.DEBITCARDNUMBER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: DebitCard.EXPIRYDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: DebitCard.BANKNAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: DebitCard.CVV,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: DebitCard.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: DebitCard.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _DebitCardModelType extends ModelType<DebitCard> {
  const _DebitCardModelType();

  @override
  DebitCard fromJson(Map<String, dynamic> jsonData) {
    return DebitCard.fromJson(jsonData);
  }
}
