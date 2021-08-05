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

/** This is an auto generated class representing the Reward type in your schema. */
@immutable
class Reward extends Model {
  static const classType = const _RewardModelType();
  final String id;
  final String? _name;
  final String? _category;
  final String? _shortDescription;
  final String? _longDescription;
  final double? _amount;
  final String? _image;
  final String? _rewardPartnerID;
  final RewardTransaction? _RewardtoRewardTransaction;
  final String? _shopID;
  final String? _rewardcategoryID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String get name {
    try {
      return _name!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get category {
    try {
      return _category!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get shortDescription {
    try {
      return _shortDescription!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String? get longDescription {
    return _longDescription;
  }

  double? get amount {
    return _amount;
  }

  String? get image {
    return _image;
  }

  String? get rewardPartnerID {
    return _rewardPartnerID;
  }

  RewardTransaction? get RewardtoRewardTransaction {
    return _RewardtoRewardTransaction;
  }

  String? get shopID {
    return _shopID;
  }

  String? get rewardcategoryID {
    return _rewardcategoryID;
  }

  const Reward._internal(
      {required this.id,
      required name,
      required category,
      required shortDescription,
      longDescription,
      amount,
      image,
      rewardPartnerID,
      RewardtoRewardTransaction,
      shopID,
      rewardcategoryID})
      : _name = name,
        _category = category,
        _shortDescription = shortDescription,
        _longDescription = longDescription,
        _amount = amount,
        _image = image,
        _rewardPartnerID = rewardPartnerID,
        _RewardtoRewardTransaction = RewardtoRewardTransaction,
        _shopID = shopID,
        _rewardcategoryID = rewardcategoryID;

  factory Reward(
      {String? id,
      required String name,
      required String category,
      required String shortDescription,
      String? longDescription,
      double? amount,
      String? image,
      String? rewardPartnerID,
      RewardTransaction? RewardtoRewardTransaction,
      String? shopID,
      String? rewardcategoryID}) {
    return Reward._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        category: category,
        shortDescription: shortDescription,
        longDescription: longDescription,
        amount: amount,
        image: image,
        rewardPartnerID: rewardPartnerID,
        RewardtoRewardTransaction: RewardtoRewardTransaction,
        shopID: shopID,
        rewardcategoryID: rewardcategoryID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reward &&
        id == other.id &&
        _name == other._name &&
        _category == other._category &&
        _shortDescription == other._shortDescription &&
        _longDescription == other._longDescription &&
        _amount == other._amount &&
        _image == other._image &&
        _rewardPartnerID == other._rewardPartnerID &&
        _RewardtoRewardTransaction == other._RewardtoRewardTransaction &&
        _shopID == other._shopID &&
        _rewardcategoryID == other._rewardcategoryID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Reward {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("shortDescription=" + "$_shortDescription" + ", ");
    buffer.write("longDescription=" + "$_longDescription" + ", ");
    buffer.write(
        "amount=" + (_amount != null ? _amount!.toString() : "null") + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("rewardPartnerID=" + "$_rewardPartnerID" + ", ");
    buffer.write("RewardtoRewardTransaction=" +
        (_RewardtoRewardTransaction != null
            ? _RewardtoRewardTransaction!.toString()
            : "null") +
        ", ");
    buffer.write("shopID=" + "$_shopID" + ", ");
    buffer.write("rewardcategoryID=" + "$_rewardcategoryID");
    buffer.write("}");

    return buffer.toString();
  }

  Reward copyWith(
      {String? id,
      String? name,
      String? category,
      String? shortDescription,
      String? longDescription,
      double? amount,
      String? image,
      String? rewardPartnerID,
      RewardTransaction? RewardtoRewardTransaction,
      String? shopID,
      String? rewardcategoryID}) {
    return Reward(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
        amount: amount ?? this.amount,
        image: image ?? this.image,
        rewardPartnerID: rewardPartnerID ?? this.rewardPartnerID,
        RewardtoRewardTransaction:
            RewardtoRewardTransaction ?? this.RewardtoRewardTransaction,
        shopID: shopID ?? this.shopID,
        rewardcategoryID: rewardcategoryID ?? this.rewardcategoryID);
  }

  Reward.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _name = json['name'],
        _category = json['category'],
        _shortDescription = json['shortDescription'],
        _longDescription = json['longDescription'],
        _amount = json['amount'],
        _image = json['image'],
        _rewardPartnerID = json['rewardPartnerID'],
        _RewardtoRewardTransaction =
            json['RewardtoRewardTransaction']?['serializedData'] != null
                ? RewardTransaction.fromJson(new Map<String, dynamic>.from(
                    json['RewardtoRewardTransaction']['serializedData']))
                : null,
        _shopID = json['shopID'],
        _rewardcategoryID = json['rewardcategoryID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': _name,
        'category': _category,
        'shortDescription': _shortDescription,
        'longDescription': _longDescription,
        'amount': _amount,
        'image': _image,
        'rewardPartnerID': _rewardPartnerID,
        'RewardtoRewardTransaction': _RewardtoRewardTransaction?.toJson(),
        'shopID': _shopID,
        'rewardcategoryID': _rewardcategoryID
      };

  static final QueryField ID = QueryField(fieldName: "reward.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField SHORTDESCRIPTION =
      QueryField(fieldName: "shortDescription");
  static final QueryField LONGDESCRIPTION =
      QueryField(fieldName: "longDescription");
  static final QueryField AMOUNT = QueryField(fieldName: "amount");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField REWARDPARTNERID =
      QueryField(fieldName: "rewardPartnerID");
  static final QueryField REWARDTOREWARDTRANSACTION = QueryField(
      fieldName: "RewardtoRewardTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static final QueryField SHOPID = QueryField(fieldName: "shopID");
  static final QueryField REWARDCATEGORYID =
      QueryField(fieldName: "rewardcategoryID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reward";
    modelSchemaDefinition.pluralName = "Rewards";

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
        key: Reward.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.CATEGORY,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.SHORTDESCRIPTION,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.LONGDESCRIPTION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.AMOUNT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.IMAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.REWARDPARTNERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Reward.REWARDTOREWARDTRANSACTION,
        isRequired: false,
        targetName: "rewardRewardtoRewardTransactionId",
        ofModelName: (RewardTransaction).toString()));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.SHOPID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Reward.REWARDCATEGORYID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _RewardModelType extends ModelType<Reward> {
  const _RewardModelType();

  @override
  Reward fromJson(Map<String, dynamic> jsonData) {
    return Reward.fromJson(jsonData);
  }
}
