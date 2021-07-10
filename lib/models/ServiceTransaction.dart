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


/** This is an auto generated class representing the ServiceTransaction type in your schema. */
@immutable
class ServiceTransaction extends Model {
  static const classType = const _ServiceTransactionModelType();
  final String id;
  final TemporalDate? _dueDate;
  final TemporalDate? _paidOn;
  final int? _rewardPoints;
  final String? _billproviderID;
  final String? _userID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalDate? get dueDate {
    return _dueDate;
  }
  
  TemporalDate? get paidOn {
    return _paidOn;
  }
  
  int? get rewardPoints {
    return _rewardPoints;
  }
  
  String? get billproviderID {
    return _billproviderID;
  }
  
  String? get userID {
    return _userID;
  }
  
  const ServiceTransaction._internal({required this.id, dueDate, paidOn, rewardPoints, billproviderID, userID}): _dueDate = dueDate, _paidOn = paidOn, _rewardPoints = rewardPoints, _billproviderID = billproviderID, _userID = userID;
  
  factory ServiceTransaction({String? id, TemporalDate? dueDate, TemporalDate? paidOn, int? rewardPoints, String? billproviderID, String? userID}) {
    return ServiceTransaction._internal(
      id: id == null ? UUID.getUUID() : id,
      dueDate: dueDate,
      paidOn: paidOn,
      rewardPoints: rewardPoints,
      billproviderID: billproviderID,
      userID: userID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ServiceTransaction &&
      id == other.id &&
      _dueDate == other._dueDate &&
      _paidOn == other._paidOn &&
      _rewardPoints == other._rewardPoints &&
      _billproviderID == other._billproviderID &&
      _userID == other._userID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ServiceTransaction {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("dueDate=" + (_dueDate != null ? _dueDate!.format() : "null") + ", ");
    buffer.write("paidOn=" + (_paidOn != null ? _paidOn!.format() : "null") + ", ");
    buffer.write("rewardPoints=" + (_rewardPoints != null ? _rewardPoints!.toString() : "null") + ", ");
    buffer.write("billproviderID=" + "$_billproviderID" + ", ");
    buffer.write("userID=" + "$_userID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ServiceTransaction copyWith({String? id, TemporalDate? dueDate, TemporalDate? paidOn, int? rewardPoints, String? billproviderID, String? userID}) {
    return ServiceTransaction(
      id: id ?? this.id,
      dueDate: dueDate ?? this.dueDate,
      paidOn: paidOn ?? this.paidOn,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      billproviderID: billproviderID ?? this.billproviderID,
      userID: userID ?? this.userID);
  }
  
  ServiceTransaction.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _dueDate = json['dueDate'] != null ? TemporalDate.fromString(json['dueDate']) : null,
      _paidOn = json['paidOn'] != null ? TemporalDate.fromString(json['paidOn']) : null,
      _rewardPoints = json['rewardPoints'],
      _billproviderID = json['billproviderID'],
      _userID = json['userID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'dueDate': _dueDate?.format(), 'paidOn': _paidOn?.format(), 'rewardPoints': _rewardPoints, 'billproviderID': _billproviderID, 'userID': _userID
  };

  static final QueryField ID = QueryField(fieldName: "serviceTransaction.id");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField PAIDON = QueryField(fieldName: "paidOn");
  static final QueryField REWARDPOINTS = QueryField(fieldName: "rewardPoints");
  static final QueryField BILLPROVIDERID = QueryField(fieldName: "billproviderID");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ServiceTransaction";
    modelSchemaDefinition.pluralName = "ServiceTransactions";
    
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
      key: ServiceTransaction.DUEDATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceTransaction.PAIDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceTransaction.REWARDPOINTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceTransaction.BILLPROVIDERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ServiceTransaction.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ServiceTransactionModelType extends ModelType<ServiceTransaction> {
  const _ServiceTransactionModelType();
  
  @override
  ServiceTransaction fromJson(Map<String, dynamic> jsonData) {
    return ServiceTransaction.fromJson(jsonData);
  }
}