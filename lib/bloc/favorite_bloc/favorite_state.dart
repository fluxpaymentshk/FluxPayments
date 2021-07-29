import 'package:flux_payments/models/Favorite.dart';
import 'package:flux_payments/models/Reward.dart';

abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitialState extends FavoritesState {
  const FavoritesInitialState();
}

class LoadingFavorites extends FavoritesState {
  const LoadingFavorites();
}

class LoadedFavorites extends FavoritesState {
  final List<Reward> favorites;
  const LoadedFavorites({required this.favorites});
}

class ErrorFavorites extends FavoritesState {
  final String? message;
  const ErrorFavorites(this.message);
}
