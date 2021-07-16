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


/** This is an auto generated class representing the ExternalAdvertisers type in your schema. */
@immutable
class ExternalAdvertisers extends Model {
  static const classType = const _ExternalAdvertisersModelType();
  final String id;
  final String? _name;
  final String? _log;
  final String? _banner;
  final String? _shortDescription;
  final String? _longDescriptio;
  final String? _productName;
  final String? _category;
  final int? _score;
  final String? _productPic;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get log {
    return _log;
  }
  
  String? get banner {
    return _banner;
  }
  
  String? get shortDescription {
    return _shortDescription;
  }
  
  String? get longDescriptio {
    return _longDescriptio;
  }
  
  String get productName {
    try {
      return _productName!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String? get category {
    return _category;
  }
  
  int? get score {
    return _score;
  }
  
  String? get productPic {
    return _productPic;
  }
  
  const ExternalAdvertisers._internal({required this.id, required name, log, banner, shortDescription, longDescriptio, required productName, category, score, productPic}): _name = name, _log = log, _banner = banner, _shortDescription = shortDescription, _longDescriptio = longDescriptio, _productName = productName, _category = category, _score = score, _productPic = productPic;
  
  factory ExternalAdvertisers({String? id, required String name, String? log, String? banner, String? shortDescription, String? longDescriptio, required String productName, String? category, int? score, String? productPic}) {
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
      _name == other._name &&
      _log == other._log &&
      _banner == other._banner &&
      _shortDescription == other._shortDescription &&
      _longDescriptio == other._longDescriptio &&
      _productName == other._productName &&
      _category == other._category &&
      _score == other._score &&
      _productPic == other._productPic;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ExternalAdvertisers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("log=" + "$_log" + ", ");
    buffer.write("banner=" + "$_banner" + ", ");
    buffer.write("shortDescription=" + "$_shortDescription" + ", ");
    buffer.write("longDescriptio=" + "$_longDescriptio" + ", ");
    buffer.write("productName=" + "$_productName" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("productPic=" + "$_productPic");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ExternalAdvertisers copyWith({String? id, String? name, String? log, String? banner, String? shortDescription, String? longDescriptio, String? productName, String? category, int? score, String? productPic}) {
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
      _name = json['name'],
      _log = json['log'],
      _banner = json['banner'],
      _shortDescription = json['shortDescription'],
      _longDescriptio = json['longDescriptio'],
      _productName = json['productName'],
      _category = json['category'],
      _score = json['score'],
      _productPic = json['productPic'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'log': _log, 'banner': _banner, 'shortDescription': _shortDescription, 'longDescriptio': _longDescriptio, 'productName': _productName, 'category': _category, 'score': _score, 'productPic': _productPic
  };

  static final QueryField ID = QueryField(fieldName: "externalAdvertisers.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField LOG = QueryField(fieldName: "log");
  static final QueryField BANNER = QueryField(fieldName: "banner");
  static final QueryField SHORTDESCRIPTION = QueryField(fieldName: "shortDescription");
  static final QueryField LONGDESCRIPTIO = QueryField(fieldName: "longDescriptio");
  static final QueryField PRODUCTNAME = QueryField(fieldName: "productName");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField SCORE = QueryField(fieldName: "score");
  static final QueryField PRODUCTPIC = QueryField(fieldName: "productPic");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ExternalAdvertisers";
    modelSchemaDefinition.pluralName = "ExternalAdvertisers";
    
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
      key: ExternalAdvertisers.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.LOG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.BANNER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.SHORTDESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.LONGDESCRIPTIO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.PRODUCTNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.CATEGORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.SCORE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ExternalAdvertisers.PRODUCTPIC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ExternalAdvertisersModelType extends ModelType<ExternalAdvertisers> {
  const _ExternalAdvertisersModelType();
  
  @override
  ExternalAdvertisers fromJson(Map<String, dynamic> jsonData) {
    return ExternalAdvertisers.fromJson(jsonData);
  }
}