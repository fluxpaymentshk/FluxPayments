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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the BillProvider type in your schema. */
@immutable
class BillProvider extends Model {
  static const classType = const _BillProviderModelType();
  final String id;
  final String name;
  final String shortDescription;
  final String logo;
  final List<UserBillProvider> ProvidesUserBill;
  final List<Service> hasServices;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const BillProvider._internal(
      {@required this.id,
      this.name,
      this.shortDescription,
      this.logo,
      this.ProvidesUserBill,
      this.hasServices});

  factory BillProvider(
      {String id,
      String name,
      String shortDescription,
      String logo,
      List<UserBillProvider> ProvidesUserBill,
      List<Service> hasServices}) {
    return BillProvider._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        shortDescription: shortDescription,
        logo: logo,
        ProvidesUserBill: ProvidesUserBill != null
            ? List<UserBillProvider>.unmodifiable(ProvidesUserBill)
            : ProvidesUserBill,
        hasServices: hasServices != null
            ? List<Service>.unmodifiable(hasServices)
            : hasServices);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BillProvider &&
        id == other.id &&
        name == other.name &&
        shortDescription == other.shortDescription &&
        logo == other.logo &&
        DeepCollectionEquality()
            .equals(ProvidesUserBill, other.ProvidesUserBill) &&
        DeepCollectionEquality().equals(hasServices, other.hasServices);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("BillProvider {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("shortDescription=" + "$shortDescription" + ", ");
    buffer.write("logo=" + "$logo");
    buffer.write("}");

    return buffer.toString();
  }

  BillProvider copyWith(
      {String id,
      String name,
      String shortDescription,
      String logo,
      List<UserBillProvider> ProvidesUserBill,
      List<Service> hasServices}) {
    return BillProvider(
        id: id ?? this.id,
        name: name ?? this.name,
        shortDescription: shortDescription ?? this.shortDescription,
        logo: logo ?? this.logo,
        ProvidesUserBill: ProvidesUserBill ?? this.ProvidesUserBill,
        hasServices: hasServices ?? this.hasServices);
  }

  BillProvider.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        shortDescription = json['shortDescription'],
        logo = json['logo'],
        ProvidesUserBill = json['ProvidesUserBill'] is List
            ? (json['ProvidesUserBill'] as List)
                .map((e) =>
                    UserBillProvider.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        hasServices = json['hasServices'] is List
            ? (json['hasServices'] as List)
                .map((e) => Service.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'shortDescription': shortDescription,
        'logo': logo,
        'ProvidesUserBill': ProvidesUserBill?.map((e) => e?.toJson())?.toList(),
        'hasServices': hasServices?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "billProvider.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField SHORTDESCRIPTION =
      QueryField(fieldName: "shortDescription");
  static final QueryField LOGO = QueryField(fieldName: "logo");
  static final QueryField PROVIDESUSERBILL = QueryField(
      fieldName: "ProvidesUserBill",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (UserBillProvider).toString()));
  static final QueryField HASSERVICES = QueryField(
      fieldName: "hasServices",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Service).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "BillProvider";
    modelSchemaDefinition.pluralName = "BillProviders";

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
        key: BillProvider.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: BillProvider.SHORTDESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: BillProvider.LOGO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: BillProvider.PROVIDESUSERBILL,
        isRequired: false,
        ofModelName: (UserBillProvider).toString(),
        associatedKey: UserBillProvider.BILLPROVIDERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: BillProvider.HASSERVICES,
        isRequired: false,
        ofModelName: (Service).toString(),
        associatedKey: Service.BILLPROVIDERID));
  });
}

class _BillProviderModelType extends ModelType<BillProvider> {
  const _BillProviderModelType();

  @override
  BillProvider fromJson(Map<String, dynamic> jsonData) {
    return BillProvider.fromJson(jsonData);
  }
}
