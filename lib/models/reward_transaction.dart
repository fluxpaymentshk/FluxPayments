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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the RewardTransaction type in your schema. */
@immutable
class RewardTransaction extends Model {
  static const classType = const _RewardTransactionModelType();
  final String id;
  final double amount;
  final TemporalDateTime timestamp;
  final String userID;
  final String rewardpartnerID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const RewardTransaction._internal(
      {@required this.id,
      this.amount,
      this.timestamp,
      this.userID,
      this.rewardpartnerID});

  factory RewardTransaction(
      {String id,
      double amount,
      TemporalDateTime timestamp,
      String userID,
      String rewardpartnerID}) {
    return RewardTransaction._internal(
        id: id == null ? UUID.getUUID() : id,
        amount: amount,
        timestamp: timestamp,
        userID: userID,
        rewardpartnerID: rewardpartnerID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardTransaction &&
        id == other.id &&
        amount == other.amount &&
        timestamp == other.timestamp &&
        userID == other.userID &&
        rewardpartnerID == other.rewardpartnerID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RewardTransaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "amount=" + (amount != null ? amount.toString() : "null") + ", ");
    buffer.write("timestamp=" +
        (timestamp != null ? timestamp.format() : "null") +
        ", ");
    buffer.write("userID=" + "$userID" + ", ");
    buffer.write("rewardpartnerID=" + "$rewardpartnerID");
    buffer.write("}");

    return buffer.toString();
  }

  RewardTransaction copyWith(
      {String id,
      double amount,
      TemporalDateTime timestamp,
      String userID,
      String rewardpartnerID}) {
    return RewardTransaction(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        timestamp: timestamp ?? this.timestamp,
        userID: userID ?? this.userID,
        rewardpartnerID: rewardpartnerID ?? this.rewardpartnerID);
  }

  RewardTransaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        amount = json['amount'],
        timestamp = json['timestamp'] != null
            ? TemporalDateTime.fromString(json['timestamp'])
            : null,
        userID = json['userID'],
        rewardpartnerID = json['rewardpartnerID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'amount': amount,
        'timestamp': timestamp?.format(),
        'userID': userID,
        'rewardpartnerID': rewardpartnerID
      };

  static final QueryField ID = QueryField(fieldName: "rewardTransaction.id");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField TIMESTAMP = QueryField(fieldName: "timestamp");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField REWARDPARTNERID =
      QueryField(fieldName: "rewardpartnerID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RewardTransaction";
    modelSchemaDefinition.pluralName = "RewardTransactions";

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
        key: RewardTransaction.AMOUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardTransaction.TIMESTAMP,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardTransaction.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardTransaction.REWARDPARTNERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _RewardTransactionModelType extends ModelType<RewardTransaction> {
  const _RewardTransactionModelType();

  @override
  RewardTransaction fromJson(Map<String, dynamic> jsonData) {
    return RewardTransaction.fromJson(jsonData);
  }
}
