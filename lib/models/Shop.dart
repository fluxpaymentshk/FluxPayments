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

/** This is an auto generated class representing the Shop type in your schema. */
@immutable
class Shop extends Model {
  static const classType = const _ShopModelType();
  final String id;
  final String? _address;
  final String? _name;
  final String? _mapLink;
  final String? _image;
  final String? _rewardpartnerID;
  final List<Reward>? _rewardshops;
  final RewardTransaction? _ShopToRewardTransaction;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  String get address {
    try {
      return _address!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
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

  String? get mapLink {
    return _mapLink;
  }

  String? get image {
    return _image;
  }

  String get rewardpartnerID {
    try {
      return _rewardpartnerID!;
    } catch (e) {
      throw new DataStoreException(
          DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: DataStoreExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  List<Reward>? get rewardshops {
    return _rewardshops;
  }

  RewardTransaction? get ShopToRewardTransaction {
    return _ShopToRewardTransaction;
  }

  const Shop._internal(
      {required this.id,
      required address,
      required name,
      mapLink,
      image,
      required rewardpartnerID,
      rewardshops,
      ShopToRewardTransaction})
      : _address = address,
        _name = name,
        _mapLink = mapLink,
        _image = image,
        _rewardpartnerID = rewardpartnerID,
        _rewardshops = rewardshops,
        _ShopToRewardTransaction = ShopToRewardTransaction;

  factory Shop(
      {String? id,
      required String address,
      required String name,
      String? mapLink,
      String? image,
      required String rewardpartnerID,
      List<Reward>? rewardshops,
      RewardTransaction? ShopToRewardTransaction}) {
    return Shop._internal(
        id: id == null ? UUID.getUUID() : id,
        address: address,
        name: name,
        mapLink: mapLink,
        image: image,
        rewardpartnerID: rewardpartnerID,
        rewardshops: rewardshops != null
            ? List<Reward>.unmodifiable(rewardshops)
            : rewardshops,
        ShopToRewardTransaction: ShopToRewardTransaction);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shop &&
        id == other.id &&
        _address == other._address &&
        _name == other._name &&
        _mapLink == other._mapLink &&
        _image == other._image &&
        _rewardpartnerID == other._rewardpartnerID &&
        DeepCollectionEquality().equals(_rewardshops, other._rewardshops) &&
        _ShopToRewardTransaction == other._ShopToRewardTransaction;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Shop {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("mapLink=" + "$_mapLink" + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("rewardpartnerID=" + "$_rewardpartnerID" + ", ");
    buffer.write("ShopToRewardTransaction=" +
        (_ShopToRewardTransaction != null
            ? _ShopToRewardTransaction!.toString()
            : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Shop copyWith(
      {String? id,
      String? address,
      String? name,
      String? mapLink,
      String? image,
      String? rewardpartnerID,
      List<Reward>? rewardshops,
      RewardTransaction? ShopToRewardTransaction}) {
    return Shop(
        id: id ?? this.id,
        address: address ?? this.address,
        name: name ?? this.name,
        mapLink: mapLink ?? this.mapLink,
        image: image ?? this.image,
        rewardpartnerID: rewardpartnerID ?? this.rewardpartnerID,
        rewardshops: rewardshops ?? this.rewardshops,
        ShopToRewardTransaction:
            ShopToRewardTransaction ?? this.ShopToRewardTransaction);
  }

  Shop.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        _address = json['address'],
        _name = json['name'],
        _mapLink = json['mapLink'],
        _image = json['image'],
        _rewardpartnerID = json['rewardpartnerID'],
        _rewardshops = json['rewardshops'] is List
            ? (json['rewardshops'] as List)
                .where((e) => e?['serializedData'] != null)
                .map((e) => Reward.fromJson(
                    new Map<String, dynamic>.from(e['serializedData'])))
                .toList()
            : null,
        _ShopToRewardTransaction =
            json['ShopToRewardTransaction']?['serializedData'] != null
                ? RewardTransaction.fromJson(new Map<String, dynamic>.from(
                    json['ShopToRewardTransaction']['serializedData']))
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': _address,
        'name': _name,
        'mapLink': _mapLink,
        'image': _image,
        'rewardpartnerID': _rewardpartnerID,
        'rewardshops': _rewardshops?.map((e) => e?.toJson())?.toList(),
        'ShopToRewardTransaction': _ShopToRewardTransaction?.toJson()
      };

  static final QueryField ID = QueryField(fieldName: "shop.id");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MAPLINK = QueryField(fieldName: "mapLink");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField REWARDPARTNERID =
      QueryField(fieldName: "rewardpartnerID");
  static final QueryField REWARDSHOPS = QueryField(
      fieldName: "rewardshops",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (Reward).toString()));
  static final QueryField SHOPTOREWARDTRANSACTION = QueryField(
      fieldName: "ShopToRewardTransaction",
      fieldType: ModelFieldType(ModelFieldTypeEnum.model,
          ofModelName: (RewardTransaction).toString()));
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Shop";
    modelSchemaDefinition.pluralName = "Shops";

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
        key: Shop.ADDRESS,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Shop.NAME,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Shop.MAPLINK,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Shop.IMAGE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: Shop.REWARDPARTNERID,
        isRequired: true,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
        key: Shop.REWARDSHOPS,
        isRequired: false,
        ofModelName: (Reward).toString(),
        associatedKey: Reward.SHOPID));

    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
        key: Shop.SHOPTOREWARDTRANSACTION,
        isRequired: false,
        targetName: "shopShopToRewardTransactionId",
        ofModelName: (RewardTransaction).toString()));
  });
}

class _ShopModelType extends ModelType<Shop> {
  const _ShopModelType();

  @override
  Shop fromJson(Map<String, dynamic> jsonData) {
    return Shop.fromJson(jsonData);
  }
}
