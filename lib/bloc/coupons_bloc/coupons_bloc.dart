import 'package:flux_payments/repository/database_repo.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'coupons_event.dart';
import 'coupons_state.dart';
import 'package:bloc/bloc.dart';

class CouponsBloc extends Bloc<CouponsEvent, CouponsState> {
  final DatabaseRepository _databaseRepo;
  CouponsBloc(this._databaseRepo) : super(CouponsInitialState());

  @override
  Stream<CouponsState> mapEventToState(CouponsEvent event) async* {
    if (event is GetCoupons) {
      try {
        yield LoadingCoupons();

        var fav = await _databaseRepo.getUserCoupons(
            page: event.page, coupons: event.coupons, userID: event.userID);
        try {
          yield LoadedCoupons(coupons: fav);
        } catch (e) {
          yield ErrorCoupons("Unable to load Coupons List !");
        }
      } catch (e) {
        yield ErrorCoupons("Unable to load Coupons List !");
      }
    }
  }
}
