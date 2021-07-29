import 'dart:developer';

import 'package:flux_payments/models/Rewards.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class CouponsSearchBaseRepository {
  Future<List<Rewards>> getSearchRewardResult();
}

class CouponsSearchRepository implements CouponsSearchBaseRepository {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  Future<List<Rewards>> getSearchRewardResult() async {
    try {
      return await _databaseLambdaService.getRewards();
    } catch (e) {
      log("$e");
      rethrow;
    }
  }
}
