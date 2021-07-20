import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'advertiser_event.dart';
import 'advertiser_state.dart';

class AdvertiserBloc extends Bloc<AdvertiserEvent, AdvertiserState> {
  final DatabaseRepository _databaseRepository;
  AdvertiserBloc(this._databaseRepository) : super(AdvertiserInitialState());

  @override
  Stream<AdvertiserState> mapEventToState(AdvertiserEvent event) async* {
    if (event is GetExternalAdvertiserEvent) {
      try {
        yield LoadingExternalAdvertiser();

        await _databaseRepository
            .getExternalAdvertiserList( externalAdvertisersListData: event.externalAdvertiserList,page:event.page);
        yield LoadedExternalAdvertiser(
            externalAdvertiser: event.externalAdvertiserList);
      } catch (e) {
        yield ErrorExternalAdvertiser(
            'Unable to load External Advertisers List!');
      }
    }
    if (event is GetInternalAdvertiserEvent) {
      try {
        yield LoadingInternalAdvertiser();

        await _databaseRepository
            .getInternalAdvertiserList( internalAdvertisersListData: event.internalAdvertiserList, page: event.page);
        yield LoadedInternalAdvertiser(
            internalAdvertiser: event.internalAdvertiserList);
      } catch (e) {
        yield ErrorInternalAdvertiser(
            'Unable to load Internal Advertisers List!');
      }
    }
  }
}
