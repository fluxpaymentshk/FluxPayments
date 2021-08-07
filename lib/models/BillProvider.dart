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
// // * express or implied. See the License for the specific language governing
// * permissions and limitations under the License.
// */

// // ignore_for_file: public_member_api_docs

// import 'ModelProvider.dart';
// import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
// import 'package:collection/collection.dart';
// import 'package:flutter/foundation.dart';

// /** This is an auto generated class representing the BillProvider type in your schema. */
// @immutable
// class BillProvider extends Model {
//   static const classType = const _BillProviderModelType();
//   final String id;
//   final String? _name;
//   final String? _shortDescription;
//   final String? _logo;
//   final List<UserBillProvider>? _ProvidesUserBill;
//   final List<Service>? _hasServices;

//   @override
//   getInstanceType() => classType;

//   @override
//   String getId() {
//     return id;
//   }

//   String? get name {
//     return _name;
//   }

//   String? get shortDescription {
//     return _shortDescription;
//   }

//   String? get logo {
//     return _logo;
//   }

//   List<UserBillProvider>? get ProvidesUserBill {
//     return _ProvidesUserBill;
//   }

//   List<Service>? get hasServices {
//     return _hasServices;
//   }

//   const BillProvider._internal(
//       {required this.id,
//       name,
//       shortDescription,
//       logo,
//       ProvidesUserBill,
//       hasServices})
//       : _name = name,
//         _shortDescription = shortDescription,
//         _logo = logo,
//         _ProvidesUserBill = ProvidesUserBill,
//         _hasServices = hasServices;

//   factory BillProvider(
//       {String? id,
//       String? name,
//       String? shortDescription,
//       String? logo,
//       List<UserBillProvider>? ProvidesUserBill,
//       List<Service>? hasServices}) {
//     return BillProvider._internal(
//         id: id == null ? UUID.getUUID() : id,
//         name: name,
//         shortDescription: shortDescription,
//         logo: logo,
//         ProvidesUserBill: ProvidesUserBill != null
//             ? List<UserBillProvider>.unmodifiable(ProvidesUserBill)
//             : ProvidesUserBill,
//         hasServices: hasServices != null
//             ? List<Service>.unmodifiable(hasServices)
//             : hasServices);
//   }

//   bool equals(Object other) {
//     return this == other;
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(other, this)) return true;
//     return other is BillProvider &&
//         id == other.id &&
//         _name == other._name &&
//         _shortDescription == other._shortDescription &&
//         _logo == other._logo &&
//         DeepCollectionEquality()
//             .equals(_ProvidesUserBill, other._ProvidesUserBill) &&
//         DeepCollectionEquality().equals(_hasServices, other._hasServices);
//   }

//   @override
//   int get hashCode => toString().hashCode;

//   @override
//   String toString() {
//     var buffer = new StringBuffer();

//     buffer.write("BillProvider {");
//     buffer.write("id=" + "$id" + ", ");
//     buffer.write("name=" + "$_name" + ", ");
//     buffer.write("shortDescription=" + "$_shortDescription" + ", ");
//     buffer.write("logo=" + "$_logo");
//     buffer.write("}");

//     return buffer.toString();
//   }

//   BillProvider copyWith(
//       {String? id,
//       String? name,
//       String? shortDescription,
//       String? logo,
//       List<UserBillProvider>? ProvidesUserBill,
//       List<Service>? hasServices}) {
//     return BillProvider(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         shortDescription: shortDescription ?? this.shortDescription,
//         logo: logo ?? this.logo,
//         ProvidesUserBill: ProvidesUserBill ?? this.ProvidesUserBill,
//         hasServices: hasServices ?? this.hasServices);
//   }

//   BillProvider.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         _name = json['name'],
//         _shortDescription = json['shortDescription'],
//         _logo = json['logo'],
//         _ProvidesUserBill = json['ProvidesUserBill'] is List
//             ? (json['ProvidesUserBill'] as List)
//                 .where((e) => e?['serializedData'] != null)
//                 .map((e) => UserBillProvider.fromJson(
//                     new Map<String, dynamic>.from(e['serializedData'])))
//                 .toList()
//             : null,
//         _hasServices = json['hasServices'] is List
//             ? (json['hasServices'] as List)
//                 .where((e) => e?['serializedData'] != null)
//                 .map((e) => Service.fromJson(
//                     new Map<String, dynamic>.from(e['serializedData'])))
//                 .toList()
//             : null;

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'name': _name,
//         'shortDescription': _shortDescription,
//         'logo': _logo,
//         'ProvidesUserBill':
//             _ProvidesUserBill?.map((e) => e?.toJson())?.toList(),
//         'hasServices': _hasServices?.map((e) => e?.toJson())?.toList()
//       };

//   static final QueryField ID = QueryField(fieldName: "billProvider.id");
//   static final QueryField NAME = QueryField(fieldName: "name");
//   static final QueryField SHORTDESCRIPTION =
//       QueryField(fieldName: "shortDescription");
//   static final QueryField LOGO = QueryField(fieldName: "logo");
//   static final QueryField PROVIDESUSERBILL = QueryField(
//       fieldName: "ProvidesUserBill",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (UserBillProvider).toString()));
//   static final QueryField HASSERVICES = QueryField(
//       fieldName: "hasServices",
//       fieldType: ModelFieldType(ModelFieldTypeEnum.model,
//           ofModelName: (Service).toString()));
//   static var schema =
//       Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
//     modelSchemaDefinition.name = "BillProvider";
//     modelSchemaDefinition.pluralName = "BillProviders";

//     modelSchemaDefinition.authRules = [
//       AuthRule(authStrategy: AuthStrategy.PUBLIC, operations: [
//         ModelOperation.CREATE,
//         ModelOperation.UPDATE,
//         ModelOperation.DELETE,
//         ModelOperation.READ
//       ])
//     ];

//     modelSchemaDefinition.addField(ModelFieldDefinition.id());

//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: BillProvider.NAME,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));

//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: BillProvider.SHORTDESCRIPTION,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));

//     modelSchemaDefinition.addField(ModelFieldDefinition.field(
//         key: BillProvider.LOGO,
//         isRequired: false,
//         ofType: ModelFieldType(ModelFieldTypeEnum.string)));

//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: BillProvider.PROVIDESUSERBILL,
//         isRequired: false,
//         ofModelName: (UserBillProvider).toString(),
//         associatedKey: UserBillProvider.BILLPROVIDERID));

//     modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
//         key: BillProvider.HASSERVICES,
//         isRequired: false,
//         ofModelName: (Service).toString(),
//         associatedKey: Service.BILLPROVIDERID));
//   });
// }

// class _BillProviderModelType extends ModelType<BillProvider> {
//   const _BillProviderModelType();

//   @override
//   BillProvider fromJson(Map<String, dynamic> jsonData) {
//     return BillProvider.fromJson(jsonData);
//   }
// }
