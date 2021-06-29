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

/** This is an auto generated class representing the RewardPartner type in your schema. */
@immutable
class RewardPartner extends Model {
  static const classType = const _RewardPartnerModelType();
  final String id;
  final String name;
  final String image;
  final String shortDescription;
  final int size;
  final String banner;
  final List<Shop> franchises;
  final List<Reward> Rewards;
  final List<RewardTransaction> RewardPartnerToRewardTransactions;
  final List<InternalAdvertisers> Advertises;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const RewardPartner._internal(
      {@required this.id,
      @required this.name,
      this.image,
      @required this.shortDescription,
      this.size,
      this.banner,
      this.franchises,
      this.Rewards,
      this.RewardPartnerToRewardTransactions,
      this.Advertises});

  factory RewardPartner(
      {String id,
      @required String name,
      String image,
      @required String shortDescription,
      int size,
      String banner,
      List<Shop> franchises,
      List<Reward> Rewards,
      List<RewardTransaction> RewardPartnerToRewardTransactions,
      List<InternalAdvertisers> Advertises}) {
    return RewardPartner._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        image: image,
        shortDescription: shortDescription,
        size: size,
        banner: banner,
        franchises:
            franchises != null ? List.unmodifiable(franchises) : franchises,
        Rewards: Rewards != null ? List.unmodifiable(Rewards) : Rewards,
        RewardPartnerToRewardTransactions:
            RewardPartnerToRewardTransactions != null
                ? List.unmodifiable(RewardPartnerToRewardTransactions)
                : RewardPartnerToRewardTransactions,
        Advertises:
            Advertises != null ? List.unmodifiable(Advertises) : Advertises);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardPartner &&
        id == other.id &&
        name == other.name &&
        image == other.image &&
        shortDescription == other.shortDescription &&
        size == other.size &&
        banner == other.banner &&
        DeepCollectionEquality().equals(franchises, other.franchises) &&
        DeepCollectionEquality().equals(Rewards, other.Rewards) &&
        DeepCollectionEquality().equals(RewardPartnerToRewardTransactions,
            other.RewardPartnerToRewardTransactions) &&
        DeepCollectionEquality().equals(Advertises, other.Advertises);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RewardPartner {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("image=" + "$image" + ", ");
    buffer.write("shortDescription=" + "$shortDescription" + ", ");
    buffer.write("size=" + (size != null ? size.toString() : "null") + ", ");
    buffer.write("banner=" + "$banner");
    buffer.write("}");

    return buffer.toString();
  }

  RewardPartner copyWith(
      {String id,
      String name,
      String image,
      String shortDescription,
      int size,
      String banner,
      List<Shop> franchises,
      List<Reward> Rewards,
      List<RewardTransaction> RewardPartnerToRewardTransactions,
      List<InternalAdvertisers> Advertises}) {
    return RewardPartner(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        shortDescription: shortDescription ?? this.shortDescription,
        size: size ?? this.size,
        banner: banner ?? this.banner,
        franchises: franchises ?? this.franchises,
        Rewards: Rewards ?? this.Rewards,
        RewardPartnerToRewardTransactions: RewardPartnerToRewardTransactions ??
            this.RewardPartnerToRewardTransactions,
        Advertises: Advertises ?? this.Advertises);
  }

  RewardPartner.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        shortDescription = json['shortDescription'],
        size = json['size'],
        banner = json['banner'],
        franchises = json['franchises'] is List
            ? (json['franchises'] as List)
                .map((e) => Shop.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        Rewards = json['Rewards'] is List
            ? (json['Rewards'] as List)
                .map((e) => Reward.fromJson(new Map<String, dynamic>.from(e)))
                .toList()
            : null,
        RewardPartnerToRewardTransactions =
            json['RewardPartnerToRewardTransactions'] is List
                ? (json['RewardPartnerToRewardTransactions'] as List)
                    .map((e) => RewardTransaction.fromJson(
                        new Map<String, dynamic>.from(e)))
                    .toList()
                : null,
        Advertises = json['Advertises'] is List
            ? (json['Advertises'] as List)
                .map((e) => InternalAdvertisers.fromJson(
                    new Map<String, dynamic>.from(e)))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'shortDescription': shortDescription,
        'size': size,
        'banner': banner,
        'franchises': franchises?.map((e) => e?.toJson())?.toList(),
        'Rewards': Rewards?.map((e) => e?.toJson())?.toList(),
        'RewardPartnerToRewardTransactions':
            RewardPartnerToRewardTransactions?.map((e) => e?.toJson())
                ?.toList(),
        'Advertises': Advertises?.map((e) => e?.toJson())?.toList()
      };

  static final QueryField ID = QueryField(fieldName: "rewardPartner.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField SHORTDESCRIPTION =
      QueryField(fieldName: "shortDescription");
  static final QueryField SIZE = QueryField(fieldName: "size");
  static final QueryField BANNER = QueryField(fieldName: "banner");
  static final QueryField FRANCHISES = QueryField(
      fieldName: "franchises",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Shop).toString()));
  static final QueryField REWARDS = QueryField(
      fieldName: "Rewards",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Reward).toString()));
  static final QueryField REWARDPARTNERTOREWARDTRANSACTIONS = QueryField(
      fieldName: "RewardPartnerToRewardTransactions",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static final QueryField ADVERTISES = QueryField(
      fieldName: "Advertises",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (InternalAdvertisers).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "RewardPartner";
    modelSchemaDefinition.pluralName = "RewardPartners";

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
        key: RewardPartner.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardPartner.IMAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardPartner.SHORTDESCRIPTION,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardPartner.SIZE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: RewardPartner.BANNER,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: RewardPartner.FRANCHISES,
        isRequired: false,
        ofModelName: (Shop).toString(),
        associatedKey: Shop.REWARDPARTNERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: RewardPartner.REWARDS,
        isRequired: false,
        ofModelName: (Reward).toString(),
        associatedKey: Reward.REWARDPARTNERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: RewardPartner.REWARDPARTNERTOREWARDTRANSACTIONS,
        isRequired: false,
        ofModelName: (RewardTransaction).toString(),
        associatedKey: RewardTransaction.REWARDPARTNERID));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: RewardPartner.ADVERTISES,
        isRequired: false,
        ofModelName: (InternalAdvertisers).toString(),
        associatedKey: InternalAdvertisers.REWARDPARTNERID));
  });
}

class _RewardPartnerModelType extends ModelType<RewardPartner> {
  const _RewardPartnerModelType();

  @override
  RewardPartner fromJson(Map<String, dynamic> jsonData) {
    return RewardPartner.fromJson(jsonData);
  }
}
