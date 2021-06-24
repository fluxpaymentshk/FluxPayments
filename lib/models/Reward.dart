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

/** This is an auto generated class representing the Reward type in your schema. */
@immutable
class Reward extends Model {
  static const classType = const _RewardModelType();
  final String id;
  final String name;
  final String category;
  final String shortDescription;
  final String longDescription;
  final double amount;
  final String image;
  final String rewardpartnerID;
  final RewardTransaction RewardtoRewardTransaction;
  final String shopID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const Reward._internal(
      {@required this.id,
      @required this.name,
      @required this.category,
      @required this.shortDescription,
      this.longDescription,
      this.amount,
      this.image,
      this.rewardpartnerID,
      this.RewardtoRewardTransaction,
      this.shopID});

  factory Reward(
      {String id,
      @required String name,
      @required String category,
      @required String shortDescription,
      String longDescription,
      double amount,
      String image,
      String rewardpartnerID,
      RewardTransaction RewardtoRewardTransaction,
      String shopID}) {
    return Reward._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        category: category,
        shortDescription: shortDescription,
        longDescription: longDescription,
        amount: amount,
        image: image,
        rewardpartnerID: rewardpartnerID,
        RewardtoRewardTransaction: RewardtoRewardTransaction,
        shopID: shopID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reward &&
        id == other.id &&
        name == other.name &&
        category == other.category &&
        shortDescription == other.shortDescription &&
        longDescription == other.longDescription &&
        amount == other.amount &&
        image == other.image &&
        rewardpartnerID == other.rewardpartnerID &&
        RewardtoRewardTransaction == other.RewardtoRewardTransaction &&
        shopID == other.shopID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Reward {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("category=" + "$category" + ", ");
    buffer.write("shortDescription=" + "$shortDescription" + ", ");
    buffer.write("longDescription=" + "$longDescription" + ", ");
    buffer.write(
        "amount=" + (amount != null ? amount.toString() : "null") + ", ");
    buffer.write("image=" + "$image" + ", ");
    buffer.write("rewardpartnerID=" + "$rewardpartnerID" + ", ");
    buffer.write("RewardtoRewardTransaction=" +
        (RewardtoRewardTransaction != null
            ? RewardtoRewardTransaction.toString()
            : "null") +
        ", ");
    buffer.write("shopID=" + "$shopID");
    buffer.write("}");

    return buffer.toString();
  }

  Reward copyWith(
      {String id,
      String name,
      String category,
      String shortDescription,
      String longDescription,
      double amount,
      String image,
      String rewardpartnerID,
      RewardTransaction RewardtoRewardTransaction,
      String shopID}) {
    return Reward(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
        amount: amount ?? this.amount,
        image: image ?? this.image,
        rewardpartnerID: rewardpartnerID ?? this.rewardpartnerID,
        RewardtoRewardTransaction:
            RewardtoRewardTransaction ?? this.RewardtoRewardTransaction,
        shopID: shopID ?? this.shopID);
  }

  Reward.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        category = json['category'],
        shortDescription = json['shortDescription'],
        longDescription = json['longDescription'],
        amount = json['amount'],
        image = json['image'],
        rewardpartnerID = json['rewardpartnerID'],
        RewardtoRewardTransaction = json['RewardtoRewardTransaction'] != null
            ? RewardTransaction.fromJson(new Map<String, dynamic>.from(
                json['RewardtoRewardTransaction']))
            : null,
        shopID = json['shopID'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'shortDescription': shortDescription,
        'longDescription': longDescription,
        'amount': amount,
        'image': image,
        'rewardpartnerID': rewardpartnerID,
        'RewardtoRewardTransaction': RewardtoRewardTransaction?.toJson(),
        'shopID': shopID
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
      QueryField(fieldName: "rewardpartnerID");
  static final QueryField REWARDTOREWARDTRANSACTION = QueryField(
      fieldName: "RewardtoRewardTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static final QueryField SHOPID = QueryField(fieldName: "shopID");
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
  });
}

class _RewardModelType extends ModelType<Reward> {
  const _RewardModelType();

  @override
  Reward fromJson(Map<String, dynamic> jsonData) {
    return Reward.fromJson(jsonData);
  }
}
