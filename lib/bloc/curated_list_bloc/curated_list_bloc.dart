import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/curated_list_bloc/curated_list_event.dart';
import 'package:flux_payments/models/curatedList.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'curated_list_state.dart';

class CuratedListBloc extends Bloc<CuratedListEvent, CuratedListState> {
  final DatabaseRepository _databaseRepository;
  CuratedListBloc(this._databaseRepository) : super(InitialState());

  @override
  Stream<CuratedListState> mapEventToState(CuratedListEvent event) async* {
    yield InitialState();

    if (event is LoadCuratedListEvent) {
      try {
        yield LoadingCuratedList();
        //   List<curatedList> curatedListData = [];
        await _databaseRepository.getCuratedList(
            page: event.page, curatedListData: event.curatedListData);

        yield LoadedCuratedList(curatedListData: event.curatedListData);
      } catch (e) {
        yield ErrorCuratedist('Unable to load Curated List for the user!');
      }
    }
  }
}
