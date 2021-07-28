import 'package:flux_payments/services/database_lambda.dart';

abstract class FavoriteSearchBaseRepository {
  Future<List<Map<String, dynamic>>> getSearchResult(String query);
}

class FavoriteSearchRepository implements FavoriteSearchBaseRepository {
  DatabaseLambdaService _databaseLambdaService = DatabaseLambdaService();

  @override
  Future<List<Map<String, dynamic>>> getSearchResult(String query) async {
    try {
      return await _databaseLambdaService.searchFavorites(query);
    } catch (e) {
      rethrow;
    }
  }
}
