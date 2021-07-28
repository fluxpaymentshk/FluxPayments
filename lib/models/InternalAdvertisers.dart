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


/** This is an auto generated class representing the InternalAdvertisers type in your schema. */
@immutable
class InternalAdvertisers extends Model {
  static const classType = const _InternalAdvertisersModelType();
  final String id;
  final String? _category;
  final int? _score;
  final String? _rewardpartnerID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get category {
    return _category;
  }
  
  int? get score {
    return _score;
  }
  
  String? get rewardpartnerID {
    return _rewardpartnerID;
  }
  
  const InternalAdvertisers._internal({required this.id, category, score, rewardpartnerID}): _category = category, _score = score, _rewardpartnerID = rewardpartnerID;
  
  factory InternalAdvertisers({String? id, String? category, int? score, String? rewardpartnerID}) {
    return InternalAdvertisers._internal(
      id: id == null ? UUID.getUUID() : id,
      category: category,
      score: score,
      rewardpartnerID: rewardpartnerID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InternalAdvertisers &&
      id == other.id &&
      _category == other._category &&
      _score == other._score &&
      _rewardpartnerID == other._rewardpartnerID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("InternalAdvertisers {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("rewardpartnerID=" + "$_rewardpartnerID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  InternalAdvertisers copyWith({String? id, String? category, int? score, String? rewardpartnerID}) {
    return InternalAdvertisers(
      id: id ?? this.id,
      category: category ?? this.category,
      score: score ?? this.score,
      rewardpartnerID: rewardpartnerID ?? this.rewardpartnerID);
  }
  
  InternalAdvertisers.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _category = json['category'],
      _score = json['score'],
      _rewardpartnerID = json['rewardpartnerID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'category': _category, 'score': _score, 'rewardpartnerID': _rewardpartnerID
  };

  static final QueryField ID = QueryField(fieldName: "internalAdvertisers.id");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField SCORE = QueryField(fieldName: "score");
  static final QueryField REWARDPARTNERID = QueryField(fieldName: "rewardpartnerID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "InternalAdvertisers";
    modelSchemaDefinition.pluralName = "InternalAdvertisers";
    
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
      key: InternalAdvertisers.CATEGORY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InternalAdvertisers.SCORE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: InternalAdvertisers.REWARDPARTNERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _InternalAdvertisersModelType extends ModelType<InternalAdvertisers> {
  const _InternalAdvertisersModelType();
  
  @override
  InternalAdvertisers fromJson(Map<String, dynamic> jsonData) {
    return InternalAdvertisers.fromJson(jsonData);
  }
}