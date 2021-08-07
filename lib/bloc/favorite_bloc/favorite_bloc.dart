import 'package:flux_payments/models/Reward.dart';
import 'package:flux_payments/repository/database_repo.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'favorite_event.dart';
import 'favorite_state.dart';
import 'package:bloc/bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DatabaseRepository _databaseRepo;
  FavoritesBloc(this._databaseRepo) : super(FavoritesInitialState());
  List<Reward> fav = [];
  List<String> favoritesList = [];
  List<String> get getFavoritesList {
    fav.forEach((e) {
      favoritesList.add(e.rewardPartnerID!);
    });
    return favoritesList;
  }

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is GetFavorites) {
      try {
        yield LoadingFavorites();

        fav = await _databaseRepo.getFavorites(
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
