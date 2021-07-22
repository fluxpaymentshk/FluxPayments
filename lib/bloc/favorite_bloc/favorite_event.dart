import 'package:flux_payments/models/Favorite.dart';

abstract class FavoritesEvent {
  const FavoritesEvent();
}

class GetFavorites extends FavoritesEvent {
  final List<Favorites> favorites;
  final int page;
  final String userID;
  const GetFavorites({required this.page, required this.favorites,required this.userID});
}
