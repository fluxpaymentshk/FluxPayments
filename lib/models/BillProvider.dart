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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the BillProvider type in your schema. */
@immutable
class BillProvider extends Model {
  static const classType = const _BillProviderModelType();
  final String id;
  final String name;
  final String image;
  final String shortDescription;
  final List<Service> Services;
  final List<ServiceTransaction> BillProviderToServiceTransactions;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const BillProvider._internal(
      {@required this.id,
      this.name,
      this.image,
      this.shortDescription,
      this.Services,
      this.BillProviderToServiceTransactions});

  factory BillProvider(
      {String id,
      String name,
      String image,
      String shortDescription,
      List<Service> Services,
      List<ServiceTransaction> BillProviderToServiceTransactions}) {
    return BillProvider._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        image: image,
        shortDescription: shortDescription,
        Services: Services != null ? List.unmodifiable(Services) : Services,
        BillProviderToServiceTransactions:
            BillProviderToServiceTransactions != null
                ? List.unmodifiable(BillProviderToServiceTransactions)
                : BillProviderToServiceTransactions);
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
        image == other.image &&
        shortDescription == other.shortDescription &&
        DeepCollectionEquality().equals(Services, other.Services) &&
        DeepCollectionEquality().equals(BillProviderToServiceTransactions,
            other.BillProviderToServiceTransactions);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("BillProvider {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("image=" + "$image" + ", ");
    buffer.write("shortDescription=" + "$shortDescription");
    buffer.write("}");

    return buffer.toString();
  }

  BillProvider copyWith(
      {String id,
      String name,
      String image,
      String shortDescription,
      List<Service> Services,
      List<ServiceTransaction> BillProviderToServiceTransactions}) {
    return BillProvider(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        shortDescription: shortDescription ?? this.shortDescription,
        Services: Services ?? this.Services,
        BillProviderToServiceTransactions: BillProviderToServiceTransactions ??
            this.BillProviderToServiceTransactions);
  }

  BillProvider.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        shortDescription = json['shortDescription'],
        Services = json['Services'] is List
            ? (json['Services'] as List)
                .map((e) => Service.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        BillProviderToServiceTransactions =
            json['BillProviderToServiceTransactions'] is List
                ? (json['BillProviderToServiceTransactions'] as List)
                    .map((e) => ServiceTransaction.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'shortDescription': shortDescription,
        'Services': Services?.map((e) => e?.toJson())?.toList(),
        'BillProviderToServiceTransactions':
            BillProviderToServiceTransactions?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "billProvider.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField SHORTDESCRIPTION =
      QueryField(fieldName: "shortDescription");
  static final QueryField SERVICES = QueryField(
      fieldName: "Services",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Service).toString()));
  static final QueryField BILLPROVIDERTOSERVICETRANSACTIONS = QueryField(
      fieldName: "BillProviderToServiceTransactions",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (ServiceTransaction).toString()));
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
        key: BillProvider.IMAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: BillProvider.SHORTDESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: BillProvider.SERVICES,
        isRequired: false,
        ofModelName: (Service).toString(),
        associatedKey: Service.BILLPROVIDERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: BillProvider.BILLPROVIDERTOSERVICETRANSACTIONS,
        isRequired: false,
        ofModelName: (ServiceTransaction).toString(),
        associatedKey: ServiceTransaction.BILLPROVIDERID));
  });
}

class _BillProviderModelType extends ModelType<BillProvider> {
  const _BillProviderModelType();

  @override
  BillProvider fromJson(Map<String, dynamic> jsonData) {
    return BillProvider.fromJson(jsonData);
  }
}
