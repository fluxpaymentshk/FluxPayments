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
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the UserService type in your schema. */
@immutable
class UserService extends Model {
  static const classType = const _UserServiceModelType();
  final String id;
  final String? _accountID;
  final TemporalDate? _dueDate;
  final String? _userbillproviderID;
  final ServiceTransaction? _ServicetoServiceTransaction;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String? get accountID {
    return _accountID;
  }

  TemporalDate? get dueDate {
    return _dueDate;
  }

  String? get userbillproviderID {
    return _userbillproviderID;
  }

  ServiceTransaction? get ServicetoServiceTransaction {
    return _ServicetoServiceTransaction;
  }

  const UserService._internal(
      {required this.id,
      accountID,
      dueDate,
      userbillproviderID,
      ServicetoServiceTransaction})
      : _accountID = accountID,
        _dueDate = dueDate,
        _userbillproviderID = userbillproviderID,
        _ServicetoServiceTransaction = ServicetoServiceTransaction;

  factory UserService(
      {String? id,
      String? accountID,
      TemporalDate? dueDate,
      String? userbillproviderID,
      ServiceTransaction? ServicetoServiceTransaction}) {
    return UserService._internal(
        id: id == null ? UUID.getUUID() : id,
        accountID: accountID,
        dueDate: dueDate,
        userbillproviderID: userbillproviderID,
        ServicetoServiceTransaction: ServicetoServiceTransaction);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserService &&
        id == other.id &&
        _accountID == other._accountID &&
        _dueDate == other._dueDate &&
        _userbillproviderID == other._userbillproviderID &&
        _ServicetoServiceTransaction == other._ServicetoServiceTransaction;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserService {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("accountID=" + "$_accountID" + ", ");
    buffer.write(
        "dueDate=" + (_dueDate != null ? _dueDate!.format() : "null") + ", ");
    buffer.write("userbillproviderID=" + "$_userbillproviderID" + ", ");
    buffer.write("ServicetoServiceTransaction=" +
        (_ServicetoServiceTransaction != null
            ? _ServicetoServiceTransaction!.toString()
            : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  UserService copyWith(
      {String? id,
      String? accountID,
      TemporalDate? dueDate,
      String? userbillproviderID,
      ServiceTransaction? ServicetoServiceTransaction}) {
    return UserService(
        id: id ?? this.id,
        accountID: accountID ?? this.accountID,
        dueDate: dueDate ?? this.dueDate,
        userbillproviderID: userbillproviderID ?? this.userbillproviderID,
        ServicetoServiceTransaction:
            ServicetoServiceTransaction ?? this.ServicetoServiceTransaction);
  }

  UserService.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _accountID = json['accountID'],
        _dueDate = json['dueDate'] != null
            ? TemporalDate.fromString(json['dueDate'])
            : null,
        _userbillproviderID = json['userbillproviderID'],
        _ServicetoServiceTransaction =
            json['ServicetoServiceTransaction']?['serializedData'] != null
                ? ServiceTransaction.fromJson(new Map<String, dynamic>.from(
                    json['ServicetoServiceTransaction']['serializedData']))
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountID': _accountID,
        'dueDate': _dueDate?.format(),
        'userbillproviderID': _userbillproviderID,
        'ServicetoServiceTransaction': _ServicetoServiceTransaction?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "userService.id");
  static final QueryField ACCOUNTID = QueryField(fieldName: "accountID");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField USERBILLPROVIDERID =
      QueryField(fieldName: "userbillproviderID");
  static final QueryField SERVICETOSERVICETRANSACTION = QueryField(
      fieldName: "ServicetoServiceTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ServiceTransaction).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserService";
    modelSchemaDefinition.pluralName = "UserServices";

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
        key: UserService.ACCOUNTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserService.DUEDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserService.USERBILLPROVIDERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: UserService.SERVICETOSERVICETRANSACTION,
        isRequired: false,
        targetName: "userServiceServicetoServiceTransactionId",
        ofModelName: (ServiceTransaction).toString()));
  });
}

class _UserServiceModelType extends ModelType<UserService> {
  const _UserServiceModelType();

  @override
  UserService fromJson(Map<String, dynamic> jsonData) {
    return UserService.fromJson(jsonData);
  }
}
