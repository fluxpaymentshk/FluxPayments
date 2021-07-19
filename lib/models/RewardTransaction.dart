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


/** This is an auto generated class representing the RewardTransaction type in your schema. */
@immutable
class RewardTransaction extends Model {
  static const classType = const _RewardTransactionModelType();
  final String id;
  final double? _amount;
  final TemporalDateTime? _timestamp;
  final String? _userID;
  final String? _rewardpartnerID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  double? get amount {
    return _amount;
  }
  
  TemporalDateTime? get timestamp {
    return _timestamp;
  }
  
  String? get userID {
    return _userID;
  }
  
  String? get rewardpartnerID {
    return _rewardpartnerID;
  }
  
  const RewardTransaction._internal({required this.id, amount, timestamp, userID, rewardpartnerID}): _amount = amount, _timestamp = timestamp, _userID = userID, _rewardpartnerID = rewardpartnerID;
  
  factory RewardTransaction({String? id, double? amount, TemporalDateTime? timestamp, String? userID, String? rewardpartnerID}) {
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
      _amount == other._amount &&
      _timestamp == other._timestamp &&
      _userID == other._userID &&
      _rewardpartnerID == other._rewardpartnerID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RewardTransaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("timestamp=" + (_timestamp != null ? _timestamp!.format() : "null") + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("rewardpartnerID=" + "$_rewardpartnerID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RewardTransaction copyWith({String? id, double? amount, TemporalDateTime? timestamp, String? userID, String? rewardpartnerID}) {
    return RewardTransaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      userID: userID ?? this.userID,
      rewardpartnerID: rewardpartnerID ?? this.rewardpartnerID);
  }
  
  RewardTransaction.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _amount = json['amount'],
      _timestamp = json['timestamp'] != null ? TemporalDateTime.fromString(json['timestamp']) : null,
      _userID = json['userID'],
      _rewardpartnerID = json['rewardpartnerID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'amount': _amount, 'timestamp': _timestamp?.format(), 'userID': _userID, 'rewardpartnerID': _rewardpartnerID
  };

  static final QueryField ID = QueryField(fieldName: "rewardTransaction.id");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField TIMESTAMP = QueryField(fieldName: "timestamp");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField REWARDPARTNERID = QueryField(fieldName: "rewardpartnerID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RewardTransaction";
    modelSchemaDefinition.pluralName = "RewardTransactions";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
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
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RewardTransaction.TIMESTAMP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RewardTransaction.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RewardTransaction.REWARDPARTNERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _RewardTransactionModelType extends ModelType<RewardTransaction> {
  const _RewardTransactionModelType();
  
  @override
  RewardTransaction fromJson(Map<String, dynamic> jsonData) {
    return RewardTransaction.fromJson(jsonData);
  }
}