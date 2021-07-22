import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/User.dart';
import 'package:flux_payments/services/database_lambda.dart';

abstract class databaseRepo {
  Future<void> getFavorites(
      {required int? page, required List<Favorites> favorites, required String? userID});

  Future<User> getUserDetails({required String? userID});
}

class DatabaseRepo extends databaseRepo {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();
  @override
  Future <List<Favorites>> getFavorites({required int? page, required List<Favorites> favorites, required String? userID}) async {
    return await _databaseLambdaService.getUserFavoritesList(userID: userID);
  }

  @override
  Future<User> getUserDetails({required String? userID}) async {
    return await _databaseLambdaService.getUserDetails(userID: userID);
  }

}