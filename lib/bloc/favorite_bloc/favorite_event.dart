import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/ModelProvider.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class GetFavorites extends FavoritesEvent {
  final List<Reward> favorites;
  final int page;
  final String userID;
  const GetFavorites(
      {required this.page, required this.favorites, required this.userID});
}
