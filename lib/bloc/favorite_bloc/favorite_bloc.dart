import 'package:flux_payments/repository/database_repo.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';
import 'package:bloc/bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DatabaseRepo _databaseRepo;
  FavoritesBloc(this._databaseRepo) : super(FavoritesInitialState());

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is GetFavorites) {
      try {
        yield LoadingFavorites();

        var fav = await _databaseRepo.getFavorites(
            page: event.page, favorites: event.favorites, userID: event.userID);
        try {
          yield LoadedFavorites(favorites: fav);
        } catch (e) {
          yield ErrorFavorites("Unable to load Favorites List !");
        }
      } catch (e) {
        yield ErrorFavorites("Unable to load Favorites List !");
      }
    }
  }
}
