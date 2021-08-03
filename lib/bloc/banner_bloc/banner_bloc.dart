import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/models/banner.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'banner_State.dart';
import 'banner_event.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final DatabaseRepository _databaseRepository;
  BannerBloc(this._databaseRepository) : super(BannerInitialState());

  @override
  Stream<BannerState> mapEventToState(BannerEvent event) async* {
    if (event is GetBannerEvent) {
      try {
        yield LoadingBannerState();
        String? amount, desc, dueDate, imageurl;
        Banner banner = await _databaseRepository.getBannerDetails();

        yield LoadBannerState(banner: banner);
      } catch (e) {
        yield BannerErrorState('Unable to fetch banner info!');
      }
    }
  }
}
