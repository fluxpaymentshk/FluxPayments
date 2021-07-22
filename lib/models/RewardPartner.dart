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

/** This is an auto generated class representing the RewardPartner type in your schema. */
@immutable
class RewardPartner extends Model {
  static const classType = const _RewardPartnerModelType();
  final String id;
  final String? _name;
  final String? _image;
  final String? _shortDescription;
  final int? _size;
  final String? _banner;
  final List<Shop>? _franchises;
  final List<Reward>? _Rewards;
  final List<RewardTransaction>? _RewardPartnerToRewardTransactions;
  final List<InternalAdvertisers>? _Advertises;

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

  String? get image {
    return _image;
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

  int? get size {
    return _size;
  }

  String? get banner {
    return _banner;
  }

  List<Shop>? get franchises {
    return _franchises;
  }

  List<Reward>? get Rewards {
    return _Rewards;
  }

  List<RewardTransaction>? get RewardPartnerToRewardTransactions {
    return _RewardPartnerToRewardTransactions;
  }

  List<InternalAdvertisers>? get Advertises {
    return _Advertises;
  }

  const RewardPartner._internal(
      {required this.id,
      required name,
      image,
      required shortDescription,
      size,
      banner,
      franchises,
      Rewards,
      RewardPartnerToRewardTransactions,
      Advertises})
      : _name = name,
        _image = image,
        _shortDescription = shortDescription,
        _size = size,
        _banner = banner,
        _franchises = franchises,
        _Rewards = Rewards,
        _RewardPartnerToRewardTransactions = RewardPartnerToRewardTransactions,
        _Advertises = Advertises;

  factory RewardPartner(
      {String? id,
      required String name,
      String? image,
      required String shortDescription,
      int? size,
      String? banner,
      List<Shop>? franchises,
      List<Reward>? Rewards,
      List<RewardTransaction>? RewardPartnerToRewardTransactions,
      List<InternalAdvertisers>? Advertises}) {
    return RewardPartner._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        image: image,
        shortDescription: shortDescription,
        size: size,
        banner: banner,
        franchises: franchises != null
            ? List<Shop>.unmodifiable(franchises)
            : franchises,
        Rewards: Rewards != null ? List<Reward>.unmodifiable(Rewards) : Rewards,
        RewardPartnerToRewardTransactions:
            RewardPartnerToRewardTransactions != null
                ? List<RewardTransaction>.unmodifiable(
                    RewardPartnerToRewardTransactions)
                : RewardPartnerToRewardTransactions,
        Advertises: Advertises != null
            ? List<InternalAdvertisers>.unmodifiable(Advertises)
            : Advertises);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RewardPartner &&
        id == other.id &&
        _name == other._name &&
        _image == other._image &&
        _shortDescription == other._shortDescription &&
        _size == other._size &&
        _banner == other._banner &&
        DeepCollectionEquality().equals(_franchises, other._franchises) &&
        DeepCollectionEquality().equals(_Rewards, other._Rewards) &&
        DeepCollectionEquality().equals(_RewardPartnerToRewardTransactions,
            other._RewardPartnerToRewardTransactions) &&
        DeepCollectionEquality().equals(_Advertises, other._Advertises);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("RewardPartner {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("shortDescription=" + "$_shortDescription" + ", ");
    buffer.write("size=" + (_size != null ? _size!.toString() : "null") + ", ");
    buffer.write("banner=" + "$_banner");
    buffer.write("}");

    return buffer.toString();
  }

  RewardPartner copyWith(
      {String? id,
      String? name,
      String? image,
      String? shortDescription,
      int? size,
      String? banner,
      List<Shop>? franchises,
      List<Reward>? Rewards,
      List<RewardTransaction>? RewardPartnerToRewardTransactions,
      List<InternalAdvertisers>? Advertises}) {
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
        _name = json['name'],
        _image = json['image'],
        _shortDescription = json['shortDescription'],
        _size = json['size'],
        _banner = json['banner'],
        _franchises = json['franchises'] is List
            ? (json['franchises'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => Shop.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _Rewards = json['Rewards'] is List
            ? (json['Rewards'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => Reward.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _RewardPartnerToRewardTransactions =
            json['RewardPartnerToRewardTransactions'] is List
                ? (json['RewardPartnerToRewardTransactions'] as List)
                    .where((e) => e?['serializedData'] != null)
                    .map((e) => RewardTransaction.fromJson(
                        new Map<String, dynamic>.from(e['serializedData'])))
                    .toList()
                : null,
        _Advertises = json['Advertises'] is List
            ? (json['Advertises'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => InternalAdvertisers.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': _name,
        'image': _image,
        'shortDescription': _shortDescription,
        'size': _size,
        'banner': _banner,
        'franchises': _franchises?.map((e) => e?.toJson())?.toList(),
        'Rewards': _Rewards?.map((e) => e?.toJson())?.toList(),
        'RewardPartnerToRewardTransactions':
            _RewardPartnerToRewardTransactions?.map((e) => e?.toJson())
                ?.toList(),
        'Advertises': _Advertises?.map((e) => e?.toJson())?.toList()
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
