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
import 'Bank.dart';
import 'BillProvider.dart';
import 'CreditCard.dart';
import 'DebitCard.dart';
import 'ExternalAdvertisers.dart';
import 'InternalAdvertisers.dart';
import 'Reward.dart';
import 'RewardCategory.dart';
import 'RewardPartner.dart';
import 'RewardTransaction.dart';
import 'Service.dart';
import 'ServiceTransaction.dart';
import 'Shop.dart';
import 'User.dart';
import 'UserBillProvider.dart';
import 'UserService.dart';
import 'UserWallet.dart';

export 'Bank.dart';
export 'BillProvider.dart';
export 'CreditCard.dart';
export 'DebitCard.dart';
export 'ExternalAdvertisers.dart';
export 'InternalAdvertisers.dart';
export 'Reward.dart';
export 'RewardCategory.dart';
export 'RewardPartner.dart';
export 'RewardTransaction.dart';
export 'Service.dart';
export 'ServiceTransaction.dart';
export 'Shop.dart';
export 'User.dart';
export 'UserBillProvider.dart';
export 'UserService.dart';
export 'UserWallet.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "a30c7c0f1349ff4e0d56b33a24ede353";
  @override
  List<ModelSchema> modelSchemas = [
    Bank.schema,
    BillProvider.schema,
    CreditCard.schema,
    DebitCard.schema,
    ExternalAdvertisers.schema,
    InternalAdvertisers.schema,
    Reward.schema,
    RewardCategory.schema,
    RewardPartner.schema,
    RewardTransaction.schema,
    Service.schema,
    ServiceTransaction.schema,
    Shop.schema,
    User.schema,
    UserBillProvider.schema,
    UserService.schema,
    UserWallet.schema
  ];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case "Bank":
        {
          return Bank.classType;
        }
        break;
      case "BillProvider":
        {
          return BillProvider.classType;
        }
        break;
      case "CreditCard":
        {
          return CreditCard.classType;
        }
        break;
      case "DebitCard":
        {
          return DebitCard.classType;
        }
        break;
      case "ExternalAdvertisers":
        {
          return ExternalAdvertisers.classType;
        }
        break;
      case "InternalAdvertisers":
        {
          return InternalAdvertisers.classType;
        }
        break;
      case "Reward":
        {
          return Reward.classType;
        }
        break;
      case "RewardCategory":
        {
          return RewardCategory.classType;
        }
        break;
      case "RewardPartner":
        {
          return RewardPartner.classType;
        }
        break;
      case "RewardTransaction":
        {
          return RewardTransaction.classType;
        }
        break;
      case "Service":
        {
          return Service.classType;
        }
        break;
      case "ServiceTransaction":
        {
          return ServiceTransaction.classType;
        }
        break;
      case "Shop":
        {
          return Shop.classType;
        }
        break;
      case "User":
        {
          return User.classType;
        }
        break;
      case "UserBillProvider":
        {
          return UserBillProvider.classType;
        }
        break;
      case "UserService":
        {
          return UserService.classType;
        }
        break;
      case "UserWallet":
        {
          return UserWallet.classType;
        }
        break;
      default:
        {
          throw Exception(
              "Failed to find model in model provider for model name: " +
                  modelName);
        }
    }
  }
}
