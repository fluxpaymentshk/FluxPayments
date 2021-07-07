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

/** This is an auto generated class representing the ExternalAdvertisers type in your schema. */
@immutable
class ExternalAdvertisers extends Model {
  static const classType = const _ExternalAdvertisersModelType();
  final String id;
  final String name;
  final String log;
  final String banner;
  final String shortDescription;
  final String longDescriptio;
  final String productName;
  final String category;
  final int score;
  final String productPic;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const ExternalAdvertisers._internal(
      {@required this.id,
      @required this.name,
      this.log,
      this.banner,
      this.shortDescription,
      this.longDescriptio,
      @required this.productName,
      this.category,
      this.score,
      this.productPic});

  factory ExternalAdvertisers(
      {String id,
      @required String name,
      String log,
      String banner,
      String shortDescription,
      String longDescriptio,
      @required String productName,
      String category,
      int score,
      String productPic}) {
    return ExternalAdvertisers._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        log: log,
        banner: banner,
        shortDescription: shortDescription,
        longDescriptio: longDescriptio,
        productName: productName,
        category: category,
        score: score,
        productPic: productPic);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExternalAdvertisers &&
        id == other.id &&
        name == other.name &&
        log == other.log &&
        banner == other.banner &&
        shortDescription == other.shortDescription &&
        longDescriptio == other.longDescriptio &&
        productName == other.productName &&
        category == other.category &&
        score == other.score &&
        productPic == other.productPic;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("ExternalAdvertisers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("log=" + "$log" + ", ");
    buffer.write("banner=" + "$banner" + ", ");
    buffer.write("shortDescription=" + "$shortDescription" + ", ");
    buffer.write("longDescriptio=" + "$longDescriptio" + ", ");
    buffer.write("productName=" + "$productName" + ", ");
    buffer.write("category=" + "$category" + ", ");
    buffer.write("score=" + (score != null ? score.toString() : "null") + ", ");
    buffer.write("productPic=" + "$productPic");
    buffer.write("}");

    return buffer.toString();
  }

  ExternalAdvertisers copyWith(
      {String id,
      String name,
      String log,
      String banner,
      String shortDescription,
      String longDescriptio,
      String productName,
      String category,
      int score,
      String productPic}) {
    return ExternalAdvertisers(
        id: id ?? this.id,
        name: name ?? this.name,
        log: log ?? this.log,
        banner: banner ?? this.banner,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescriptio: longDescriptio ?? this.longDescriptio,
        productName: productName ?? this.productName,
        category: category ?? this.category,
        score: score ?? this.score,
        productPic: productPic ?? this.productPic);
  }

  ExternalAdvertisers.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        log = json['log'],
        banner = json['banner'],
        shortDescription = json['shortDescription'],
        longDescriptio = json['longDescriptio'],
        productName = json['productName'],
        category = json['category'],
        score = json['score'],
        productPic = json['productPic'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'log': log,
        'banner': banner,
        'shortDescription': shortDescription,
        'longDescriptio': longDescriptio,
        'productName': productName,
        'category': category,
        'score': score,
        'productPic': productPic
      };

  static final QueryField ID = QueryField(fieldName: "externalAdvertisers.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField LOG = QueryField(fieldName: "log");
  static final QueryField BANNER = QueryField(fieldName: "banner");
  static final QueryField SHORTDESCRIPTION =
      QueryField(fieldName: "shortDescription");
  static final QueryField LONGDESCRIPTIO =
      QueryField(fieldName: "longDescriptio");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField SCORE = QueryField(fieldName: "score");
  static final QueryField PRODUCTPIC = QueryField(fieldName: "productPic");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ExternalAdvertisers";
    modelSchemaDefinition.pluralName = "ExternalAdvertisers";

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
        key: ExternalAdvertisers.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.LOG,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.BANNER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.SHORTDESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.LONGDESCRIPTIO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.PRODUCTNAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.CATEGORY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.SCORE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: ExternalAdvertisers.PRODUCTPIC,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _ExternalAdvertisersModelType extends ModelType<ExternalAdvertisers> {
  const _ExternalAdvertisersModelType();

  @override
  ExternalAdvertisers fromJson(Map<String, dynamic> jsonData) {
    return ExternalAdvertisers.fromJson(jsonData);
  }
}
