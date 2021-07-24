import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/repository/database_repository.dart';

import 'graph_event.dart';
import 'graph_state.dart';

class GraphBloc extends Bloc<GraphEvent, GraphState> {
  final DatabaseRepository _databaseRepository;
  GraphBloc(this._databaseRepository) : super(GraphInitialState());
  @override
  Stream<GraphState> mapEventToState(GraphEvent event) async* {
    if (event is GetGraphEvent) {
      try {
        yield LoadingGraphState();

        Map<String, Map<String, double>> mp = await _databaseRepository
            .getPaymentHistoryProviderWiseDetails(userID: event.UserID);

        yield LoadGraphState(graphData: mp);
      } catch (e) {
        yield ErrorGraphState( message: 'Unable to plot Graph data!');
      }
    }
  }
}
