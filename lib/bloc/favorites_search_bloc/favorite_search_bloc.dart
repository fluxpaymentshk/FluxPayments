import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_event.dart';
import 'package:flux_payments/bloc/favorites_search_bloc/favorite_search_state.dart';
import 'package:flux_payments/repository/favorite_search_repository.dart';
import 'package:flux_payments/repository/login_repository.dart';

class CouponsSearchBloc extends Bloc<CouponsSearchEvent, CouponsSearchState> {
  final CouponsSearchRepository _CouponsSearchRepository;
  CouponsSearchBloc(this._CouponsSearchRepository)
      : super(CouponsSearchInitial());

  @override
  Stream<CouponsSearchState> mapEventToState(CouponsSearchEvent event) async* {
    var request;
    yield (CouponsSearchInitial());
    log("hueeue");
    if (event is LoadCouponsSearch) {
      try {
        log("fjeh2");
        request = await _CouponsSearchRepository.getSearchRewardResult();
        log("{{{}}}");
        log("hfhhe12");
        yield (CouponsSearchStateDone(request));
      } catch (e) {
        print(e);
        yield (CouponsSearchError("Error"));
      }
    }
  }
}
