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

/** This is an auto generated class representing the Service type in your schema. */
@immutable
class Service extends Model {
  static const classType = const _ServiceModelType();
  final String id;
  final String category;
  final String billproviderID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Service._internal(
      {@required this.id, this.category, this.billproviderID});

  factory Service({String id, String category, String billproviderID}) {
    return Service._internal(
        id: id == null ? UUID.getUUID() : id,
        category: category,
        billproviderID: billproviderID);
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
        billproviderID == other.billproviderID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Service {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("category=" + "$category" + ", ");
    buffer.write("billproviderID=" + "$billproviderID");
    buffer.write("}");

    return buffer.toString();
  }

  Service copyWith({String id, String category, String billproviderID}) {
    return Service(
        id: id ?? this.id,
        category: category ?? this.category,
        billproviderID: billproviderID ?? this.billproviderID);
  }

  Service.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        category = json['category'],
        billproviderID = json['billproviderID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'category': category, 'billproviderID': billproviderID};

  static final QueryField ID = QueryField(fieldName: "service.id");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField BILLPROVIDERID =
      QueryField(fieldName: "billproviderID");
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
        key: Service.BILLPROVIDERID,
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
