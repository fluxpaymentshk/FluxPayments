import 'package:flux_payments/bloc/story_bloc/story_event.dart';
import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/ModelProvider.dart';
import 'package:flux_payments/models/Story.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/models/myCoupons.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class databaseRepo {
  Future<void> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID});

  Future<User> getUserDetails({required String? userID});

  Future<List<myCoupons>> getUserCoupons(
      {required int? page,
      required List<myCoupons> coupons,
      required String? userID});

  Future<List<Story>> getStory(
      {required int? page, required List<Story> story});
}

class DatabaseRepo extends databaseRepo {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();
  @override
  Future<List<Reward>> getFavorites(
      {required int? page,
      required List<Reward> favorites,
      required String? userID}) async {
    return await _databaseLambdaService.getUserFavoritesList(userID: userID);
  }

  @override
  Future<User> getUserDetails({required String? userID}) async {
    return await _databaseLambdaService.getUserDetails(userID: userID);
  }

  @override
  Future<List<myCoupons>> getUserCoupons(
      {required int? page,
      required List<myCoupons> coupons,
      required String? userID}) async {
    return await _databaseLambdaService.getUserCouponsList(userID: userID);
  }

  @override
  Future<List<Story>> getStory(
      {required int? page, required List<Story> story}) async {
    return await _databaseLambdaService.getStory();
  }
}
