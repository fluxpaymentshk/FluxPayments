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
import 'BillProvider.dart';
import 'Reward.dart';
import 'RewardPartner.dart';
import 'RewardTransaction.dart';
import 'Service.dart';
import 'ServiceTransaction.dart';
import 'Shop.dart';
import 'User.dart';

export 'BillProvider.dart';
export 'Reward.dart';
export 'RewardPartner.dart';
export 'RewardTransaction.dart';
export 'Service.dart';
export 'ServiceTransaction.dart';
export 'Shop.dart';
export 'User.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "ae36c60e18620748d3293e6176e82e4e";
  @override
  List<ModelSchema> modelSchemas = [
    BillProvider.schema,
    Reward.schema,
    RewardPartner.schema,
    RewardTransaction.schema,
    Service.schema,
    ServiceTransaction.schema,
    Shop.schema,
    User.schema
  ];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;

  ModelType getModelTypeByModelName(String modelName) {
    switch (modelName) {
      case "BillProvider":
        {
          return BillProvider.classType;
        }
        break;
      case "Reward":
        {
          return Reward.classType;
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
      default:
        {
          throw Exception(
              "Failed to find model in model provider for model name: " +
                  modelName);
        }
    }
  }
}
