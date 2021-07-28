abstract class FavoriteSearchState {
  const FavoriteSearchState();
}

class FavoriteSearchInitial extends FavoriteSearchState {
  const FavoriteSearchInitial();
}

class FavoriteSearchStateLoading extends FavoriteSearchState {
  const FavoriteSearchStateLoading();
}

class FavoriteSearchError extends FavoriteSearchState {
  final String message;
  const FavoriteSearchError(this.message);
}
