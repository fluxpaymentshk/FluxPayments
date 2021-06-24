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

/** This is an auto generated class representing the Service type in your schema. */
@immutable
class Service extends Model {
  static const classType = const _ServiceModelType();
  final String id;
  final String category;
  final String accountID;
  final TemporalDate dueDate;
  final String billproviderID;
  final ServiceTransaction ServiceToServiceTransaction;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Service._internal(
      {@required this.id,
      this.category,
      this.accountID,
      this.dueDate,
      this.billproviderID,
      this.ServiceToServiceTransaction,
      this.userID});

  factory Service(
      {String id,
      String category,
      String accountID,
      TemporalDate dueDate,
      String billproviderID,
      ServiceTransaction ServiceToServiceTransaction,
      String userID}) {
    return Service._internal(
        id: id == null ? UUID.getUUID() : id,
        category: category,
        accountID: accountID,
        dueDate: dueDate,
        billproviderID: billproviderID,
        ServiceToServiceTransaction: ServiceToServiceTransaction,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Service &&
        id == other.id &&
        category == other.category &&
        accountID == other.accountID &&
        dueDate == other.dueDate &&
        billproviderID == other.billproviderID &&
        ServiceToServiceTransaction == other.ServiceToServiceTransaction &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Service {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("category=" + "$category" + ", ");
    buffer.write("accountID=" + "$accountID" + ", ");
    buffer.write(
        "dueDate=" + (dueDate != null ? dueDate.format() : "null") + ", ");
    buffer.write("billproviderID=" + "$billproviderID" + ", ");
    buffer.write("ServiceToServiceTransaction=" +
        (ServiceToServiceTransaction != null
            ? ServiceToServiceTransaction.toString()
            : "null") +
        ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  Service copyWith(
      {String id,
      String category,
      String accountID,
      TemporalDate dueDate,
      String billproviderID,
      ServiceTransaction ServiceToServiceTransaction,
      String userID}) {
    return Service(
        id: id ?? this.id,
        category: category ?? this.category,
        accountID: accountID ?? this.accountID,
        dueDate: dueDate ?? this.dueDate,
        billproviderID: billproviderID ?? this.billproviderID,
        ServiceToServiceTransaction:
            ServiceToServiceTransaction ?? this.ServiceToServiceTransaction,
        userID: userID ?? this.userID);
  }

  Service.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        category = json['category'],
        accountID = json['accountID'],
        dueDate = json['dueDate'] != null
            ? TemporalDate.fromString(json['dueDate'])
            : null,
        billproviderID = json['billproviderID'],
        ServiceToServiceTransaction =
            json['ServiceToServiceTransaction'] != null
                ? ServiceTransaction.fromJson(new Map<String, dynamic>.from(
                    json['ServiceToServiceTransaction']))
                : null,
        userID = json['userID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'category': category,
        'accountID': accountID,
        'dueDate': dueDate?.format(),
        'billproviderID': billproviderID,
        'ServiceToServiceTransaction': ServiceToServiceTransaction?.toJson(),
        'userID': userID
      };

  static final QueryField ID = QueryField(fieldName: "service.id");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField ACCOUNTID = QueryField(fieldName: "accountID");
  static final QueryField DUEDATE = QueryField(fieldName: "dueDate");
  static final QueryField BILLPROVIDERID =
      QueryField(fieldName: "billproviderID");
  static final QueryField SERVICETOSERVICETRANSACTION = QueryField(
      fieldName: "ServiceToServiceTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ServiceTransaction).toString()));
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Service";
    modelSchemaDefinition.pluralName = "Services";

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
        key: Service.CATEGORY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Service.ACCOUNTID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Service.DUEDATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.date)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Service.BILLPROVIDERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Service.SERVICETOSERVICETRANSACTION,
        isRequired: false,
        targetName: "serviceServiceToServiceTransactionId",
        ofModelName: (ServiceTransaction).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Service.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _ServiceModelType extends ModelType<Service> {
  const _ServiceModelType();

  @override
  Service fromJson(Map<String, dynamic> jsonData) {
    return Service.fromJson(jsonData);
  }
}
