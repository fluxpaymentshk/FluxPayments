import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_event.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_state.dart';
import 'package:flux_payments/repository/favorite_search_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';

class FavoriteSearchBloc
    extends Bloc<FavoriteSearchEvent, FavoriteSearchState> {
  final FavoriteSearchRepository _favoriteSearchRepository;
  FavoriteSearchBloc(this._favoriteSearchRepository)
      : super(FavoriteSearchInitial());

  @override
  Stream<FavoriteSearchState> mapEventToState(
      FavoriteSearchEvent event) async* {
    var request;
    yield (FavoriteSearchInitial());
    if (event is LoadFavoriteSearch) {
      try {
        await _favoriteSearchRepository.getSearchResult(event.query ?? "");
      } catch (e) {
        yield (FavoriteSearchError("Error"));
      }
    }
  }
}
