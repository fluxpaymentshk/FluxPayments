// /*
// * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
// *
// * Licensed under the Apache License, Version 2.0 (the "License").
// * You may not use this file except in compliance with the License.
// * A copy of the License is located at
// *
// *  http://aws.amazon.com/apache2.0
// *
// * or in the "license" file accompanying this file. This file is distributed
// * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// * express or implied. See the License for the specific language governing
// * permissions and limitations under the License.
// */

// // ignore_for_file: public_member_api_docs

// import 'ModelProvider.dart';
// import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';

// /** This is an auto generated class representing the UserBillProvider type in your schema. */
// @immutable
// class UserBillProvider extends Model {
//   static const classType = const _UserBillProviderModelType();
//   final String id;
//   final List<ServiceTransaction>? _BillProviderToServiceTransactions;
//   final String? _billproviderID;
//   // final List<UserService>? _ProvideUserServices;

//   @override
//   getInstanceType() => classType;

//   @override
//   String getId() {
//     return id;
//   }

//   List<ServiceTransaction>? get BillProviderToServiceTransactions {
//     return _BillProviderToServiceTransactions;
//   }

//   String? get billproviderID {
//     return _billproviderID;
//   }

//   List<UserService>? get ProvideUserServices {
//     return _ProvideUserServices;
//   }

//   const UserBillProvider._internal(
//       {required this.id,
//       BillProviderToServiceTransactions,
//       billproviderID,
//       ProvideUserServices})
//       : _BillProviderToServiceTransactions = BillProviderToServiceTransactions,
//         _billproviderID = billproviderID,
//         _ProvideUserServices = ProvideUserServices;

//   factory UserBillProvider(
//       {String? id,
//       List<ServiceTransaction>? BillProviderToServiceTransactions,
//       String? billproviderID,
//       List<UserService>? ProvideUserServices}) {
//     return UserBillProvider._internal(
//         id: id == null ? UUID.getUUID() : id,
//         BillProviderToServiceTransactions:
//             BillProviderToServiceTransactions != null
//                 ? List<ServiceTransaction>.unmodifiable(
//                     BillProviderToServiceTransactions)
//                 : BillProviderToServiceTransactions,
//         billproviderID: billproviderID,
//         ProvideUserServices: ProvideUserServices != null
//             ? List<UserService>.unmodifiable(ProvideUserServices)
//             : ProvideUserServices);
//   }

//   bool equals(Object other) {
//     return this == other;
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is UserBillProvider &&
//         id == other.id &&
//         DeepCollectionEquality().equals(_BillProviderToServiceTransactions,
//             other._BillProviderToServiceTransactions) &&
//         _billproviderID == other._billproviderID &&
//         DeepCollectionEquality()
//             .equals(_ProvideUserServices, other._ProvideUserServices);
//   }

//   @override
//   int get hashCode => toString().hashCode;

//   @override
//   String toString() {
//     var buffer = new StringBuffer();

//     buffer.write("UserBillProvider {");
//     buffer.write("id=" + "$id" + ", ");
//     buffer.write("billproviderID=" + "$_billproviderID");
//     buffer.write("}");

//     return buffer.toString();
//   }

//   UserBillProvider copyWith(
//       {String? id,
//       List<ServiceTransaction>? BillProviderToServiceTransactions,
//       String? billproviderID,
//       List<UserService>? ProvideUserServices}) {
//     return UserBillProvider(
//         id: id ?? this.id,
//         BillProviderToServiceTransactions: BillProviderToServiceTransactions ??
//             this.BillProviderToServiceTransactions,
//         billproviderID: billproviderID ?? this.billproviderID,
//         ProvideUserServices: ProvideUserServices ?? this.ProvideUserServices);
//   }

//   UserBillProvider.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         _BillProviderToServiceTransactions =
//             json['BillProviderToServiceTransactions'] is List
//                 ? (json['BillProviderToServiceTransactions'] as List)
//                     .where((e) => e?['serializedData'] != null)
//                     .map((e) => ServiceTransaction.fromJson(
//                         new Map<String, dynamic>.from(e['serializedData'])))
//                     .toList()
//                 : null,
//         _billproviderID = json['billproviderID'],
//         _ProvideUserServices = json['ProvideUserServices'] is List
//             ? (json['ProvideUserServices'] as List)
//                 .where((e) => e?['serializedData'] != null)
//                 .map((e) => UserService.fromJson(
//                     new Map<String, dynamic>.from(e['serializedData'])))
//                 .toList()
//             : null;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'BillProviderToServiceTransactions':
//             _BillProviderToServiceTransactions?.map((e) => e?.toJson())
//                 ?.toList(),
//         'billproviderID': _billproviderID,
//         'ProvideUserServices':
//             _ProvideUserServices?.map((e) => e?.toJson())?.toList()
//       };

//   static final QueryField ID = QueryField(fieldName: "userBillProvider.id");
//   static final QueryField BILLPROVIDERTOSERVICETRANSACTIONS = QueryField(
//       fieldName: "BillProviderToServiceTransactions",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (ServiceTransaction).toString()));
//   static final QueryField BILLPROVIDERID =
//       QueryField(fieldName: "billproviderID");
//   static final QueryField PROVIDEUSERSERVICES = QueryField(
//       fieldName: "ProvideUserServices",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (UserService).toString()));
//   static var schema =
//       Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
//     modelSchemaDefinition.name = "UserBillProvider";
//     modelSchemaDefinition.pluralName = "UserBillProviders";

//     modelSchemaDefinition.authRules = [
//       AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
//         ModelOperation.CREATE,
//         ModelOperation.UPDATE,
//         ModelOperation.DELETE,
//         ModelOperation.READ
//       ])
//     ];

//     modelSchemaDefinition.addField(ModelFieldDefinition.id());

//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: UserBillProvider.BILLPROVIDERTOSERVICETRANSACTIONS,
//         isRequired: false,
//         ofModelName: (ServiceTransaction).toString(),
//         associatedKey: ServiceTransaction.BILLPROVIDERID));

//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: UserBillProvider.BILLPROVIDERID,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));

//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: UserBillProvider.PROVIDEUSERSERVICES,
//         isRequired: false,
//         ofModelName: (UserService).toString(),
//         associatedKey: UserService.USERBILLPROVIDERID));
//   });
// }

// class _UserBillProviderModelType extends ModelType<UserBillProvider> {
//   const _UserBillProviderModelType();

//   @override
//   UserBillProvider fromJson(Map<String, dynamic> jsonData) {
//     return UserBillProvider.fromJson(jsonData);
//   }
// }
