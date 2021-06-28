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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the ServiceTransaction type in your schema. */
@immutable
class ServiceTransaction extends Model {
  static const classType = const _ServiceTransactionModelType();
  final String id;
  final TemporalDate dueDate;
  final TemporalDate paidOn;
  final int rewardPoints;
  final String billproviderID;
  final String userID;
  final RewardTransaction ServiceTransactionToRewardTransaction;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const ServiceTransaction._internal(
      {@required this.id,
      this.dueDate,
      this.paidOn,
      this.rewardPoints,
      this.billproviderID,
      this.userID,
      this.ServiceTransactionToRewardTransaction});

  factory ServiceTransaction(
      {String id,
      TemporalDate dueDate,
      TemporalDate paidOn,
      int rewardPoints,
      String billproviderID,
      String userID,
      RewardTransaction ServiceTransactionToRewardTransaction}) {
    return ServiceTransaction._internal(
        id: id == null ? UUID.getUUID() : id,
        dueDate: dueDate,
        paidOn: paidOn,
        rewardPoints: rewardPoints,
        billproviderID: billproviderID,
        userID: userID,
        ServiceTransactionToRewardTransaction:
            ServiceTransactionToRewardTransaction);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceTransaction &&
        id == other.id &&
        dueDate == other.dueDate &&
        paidOn == other.paidOn &&
        rewardPoints == other.rewardPoints &&
        billproviderID == other.billproviderID &&
        userID == other.userID &&
        ServiceTransactionToRewardTransaction ==
            other.ServiceTransactionToRewardTransaction;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ServiceTransaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write(
        "dueDate=" + (dueDate != null ? dueDate.format() : "null") + ", ");
    buffer
        .write("paidOn=" + (paidOn != null ? paidOn.format() : "null") + ", ");
    buffer.write("rewardPoints=" +
        (rewardPoints != null ? rewardPoints.toString() : "null") +
        ", ");
    buffer.write("billproviderID=" + "$billproviderID" + ", ");
    buffer.write("userID=" + "$userID" + ", ");
    buffer.write("ServiceTransactionToRewardTransaction=" +
        (ServiceTransactionToRewardTransaction != null
            ? ServiceTransactionToRewardTransaction.toString()
            : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  ServiceTransaction copyWith(
      {String id,
      TemporalDate dueDate,
      TemporalDate paidOn,
      int rewardPoints,
      String billproviderID,
      String userID,
      RewardTransaction ServiceTransactionToRewardTransaction}) {
    return ServiceTransaction(
        id: id ?? this.id,
        dueDate: dueDate ?? this.dueDate,
        paidOn: paidOn ?? this.paidOn,
        rewardPoints: rewardPoints ?? this.rewardPoints,
        billproviderID: billproviderID ?? this.billproviderID,
        userID: userID ?? this.userID,
        ServiceTransactionToRewardTransaction:
            ServiceTransactionToRewardTransaction ??
                this.ServiceTransactionToRewardTransaction);
  }

  ServiceTransaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dueDate = json['dueDate'] != null
            ? TemporalDate.fromString(json['dueDate'])
            : null,
        paidOn = json['paidOn'] != null
            ? TemporalDate.fromString(json['paidOn'])
            : null,
        rewardPoints = json['rewardPoints'],
        billproviderID = json['billproviderID'],
        userID = json['userID'],
        ServiceTransactionToRewardTransaction =
            json['ServiceTransactionToRewardTransaction'] != null
                ? RewardTransaction.fromJson(new Map<String, dynamic>.from(
                    json['ServiceTransactionToRewardTransaction']))
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dueDate': dueDate?.format(),
        'paidOn': paidOn?.format(),
        'rewardPoints': rewardPoints,
        'billproviderID': billproviderID,
        'userID': userID,
        'ServiceTransactionToRewardTransaction':
            ServiceTransactionToRewardTransaction?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "serviceTransaction.id");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField PAIDON = QueryField(fieldName: "paidOn");
  static final QueryField REWARDPOINTS = QueryField(fieldName: "rewardPoints");
  static final QueryField BILLPROVIDERID =
      QueryField(fieldName: "billproviderID");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField SERVICETRANSACTIONTOREWARDTRANSACTION = QueryField(
      fieldName: "ServiceTransactionToRewardTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServiceTransaction";
    modelSchemaDefinition.pluralName = "ServiceTransactions";

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
        key: ServiceTransaction.DUEDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ServiceTransaction.PAIDON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ServiceTransaction.REWARDPOINTS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ServiceTransaction.BILLPROVIDERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ServiceTransaction.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: ServiceTransaction.SERVICETRANSACTIONTOREWARDTRANSACTION,
        isRequired: false,
        targetName: "serviceTransactionServiceTransactionToRewardTransactionId",
        ofModelName: (RewardTransaction).toString()));
  });
}

class _ServiceTransactionModelType extends ModelType<ServiceTransaction> {
  const _ServiceTransactionModelType();

  @override
  ServiceTransaction fromJson(Map<String, dynamic> jsonData) {
    return ServiceTransaction.fromJson(jsonData);
  }
}
