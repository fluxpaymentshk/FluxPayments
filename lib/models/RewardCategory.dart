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


/** This is an auto generated class representing the RewardCategory type in your schema. */
@immutable
class RewardCategory extends Model {
  static const classType = const _RewardCategoryModelType();
  final String id;
  final String? _name;
  final String? _icon;
  final String? _description;
  final List<Reward>? _categorizes;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get icon {
    return _icon;
  }
  
  String? get description {
    return _description;
  }
  
  List<Reward>? get categorizes {
    return _categorizes;
  }
  
  const RewardCategory._internal({required this.id, name, icon, description, categorizes}): _name = name, _icon = icon, _description = description, _categorizes = categorizes;
  
  factory RewardCategory({String? id, String? name, String? icon, String? description, List<Reward>? categorizes}) {
    return RewardCategory._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      icon: icon,
      description: description,
      categorizes: categorizes != null ? List<Reward>.unmodifiable(categorizes) : categorizes);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardCategory &&
      id == other.id &&
      _name == other._name &&
      _icon == other._icon &&
      _description == other._description &&
      DeepCollectionEquality().equals(_categorizes, other._categorizes);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("RewardCategory {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("icon=" + "$_icon" + ", ");
    buffer.write("description=" + "$_description");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  RewardCategory copyWith({String? id, String? name, String? icon, String? description, List<Reward>? categorizes}) {
    return RewardCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      categorizes: categorizes ?? this.categorizes);
  }
  
  RewardCategory.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _icon = json['icon'],
      _description = json['description'],
      _categorizes = json['categorizes'] is List
        ? (json['categorizes'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Reward.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'icon': _icon, 'description': _description, 'categorizes': _categorizes?.map((e) => e.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "rewardCategory.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ICON = QueryField(fieldName: "icon");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField CATEGORIZES = QueryField(
    fieldName: "categorizes",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Reward).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RewardCategory";
    modelSchemaDefinition.pluralName = "RewardCategories";
    
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
      key: RewardCategory.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RewardCategory.ICON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: RewardCategory.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: RewardCategory.CATEGORIZES,
      isRequired: false,
      ofModelName: (Reward).toString(),
      associatedKey: Reward.REWARDCATEGORYID
    ));
  });
}

class _RewardCategoryModelType extends ModelType<RewardCategory> {
  const _RewardCategoryModelType();
  
  @override
  RewardCategory fromJson(Map<String, dynamic> jsonData) {
    return RewardCategory.fromJson(jsonData);
  }
}