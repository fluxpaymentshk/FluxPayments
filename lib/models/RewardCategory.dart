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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the RewardCategory type in your schema. */
@immutable
class RewardCategory extends Model {
  static const classType = const _RewardCategoryModelType();
  final String id;
  final String name;
  final String icon;
  final String description;
  final List<Reward> categorizes;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const RewardCategory._internal(
      {@required this.id,
      this.name,
      this.icon,
      this.description,
      this.categorizes});

  factory RewardCategory(
      {String id,
      String name,
      String icon,
      String description,
      List<Reward> categorizes}) {
    return RewardCategory._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        icon: icon,
        description: description,
        categorizes:
            categorizes != null ? List.unmodifiable(categorizes) : categorizes);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardCategory &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        description == other.description &&
        DeepCollectionEquality().equals(categorizes, other.categorizes);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RewardCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("icon=" + "$icon" + ", ");
    buffer.write("description=" + "$description");
    buffer.write("}");

    return buffer.toString();
  }

  RewardCategory copyWith(
      {String id,
      String name,
      String icon,
      String description,
      List<Reward> categorizes}) {
    return RewardCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        description: description ?? this.description,
        categorizes: categorizes ?? this.categorizes);
  }

  RewardCategory.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        icon = json['icon'],
        description = json['description'],
        categorizes = json['categorizes'] is List
            ? (json['categorizes'] as List)
                .map((e) => Reward.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'categorizes': categorizes?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "rewardCategory.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ICON = QueryField(fieldName: "icon");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CATEGORIZES = QueryField(
      fieldName: "categorizes",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Reward).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RewardCategory";
    modelSchemaDefinition.pluralName = "RewardCategories";

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
        key: RewardCategory.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardCategory.ICON,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardCategory.DESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: RewardCategory.CATEGORIZES,
        isRequired: false,
        ofModelName: (Reward).toString(),
        associatedKey: Reward.REWARDCATEGORYID));
  });
}

class _RewardCategoryModelType extends ModelType<RewardCategory> {
  const _RewardCategoryModelType();

  @override
  RewardCategory fromJson(Map<String, dynamic> jsonData) {
    return RewardCategory.fromJson(jsonData);
  }
}
