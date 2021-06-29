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

/** This is an auto generated class representing the UserWallet type in your schema. */
@immutable
class UserWallet extends Model {
  static const classType = const _UserWalletModelType();
  final String id;
  final String name;
  final String upi;
  final String userID;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const UserWallet._internal(
      {@required this.id, this.name, this.upi, this.userID});

  factory UserWallet({String id, String name, String upi, String userID}) {
    return UserWallet._internal(
        id: id == null ? UUID.getUUID() : id,
        name: name,
        upi: upi,
        userID: userID);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserWallet &&
        id == other.id &&
        name == other.name &&
        upi == other.upi &&
        userID == other.userID;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("UserWallet {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("upi=" + "$upi" + ", ");
    buffer.write("userID=" + "$userID");
    buffer.write("}");

    return buffer.toString();
  }

  UserWallet copyWith({String id, String name, String upi, String userID}) {
    return UserWallet(
        id: id ?? this.id,
        name: name ?? this.name,
        upi: upi ?? this.upi,
        userID: userID ?? this.userID);
  }

  UserWallet.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        upi = json['upi'],
        userID = json['userID'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'upi': upi, 'userID': userID};

  static final QueryField ID = QueryField(fieldName: "userWallet.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField UPI = QueryField(fieldName: "upi");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserWallet";
    modelSchemaDefinition.pluralName = "UserWallets";

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
        key: UserWallet.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserWallet.UPI,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: UserWallet.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class _UserWalletModelType extends ModelType<UserWallet> {
  const _UserWalletModelType();

  @override
  UserWallet fromJson(Map<String, dynamic> jsonData) {
    return UserWallet.fromJson(jsonData);
  }
}
