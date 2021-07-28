import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_event.dart';
import 'package:flux_payments/bloc/pending_service_bloc/pending_service_state.dart';
import 'package:flux_payments/repository/database_repository.dart';

class PendingServiceBloc
    extends Bloc<PendingServiceEvent, PendingServiceState> {
  final DatabaseRepository _databaseRepository;
  PendingServiceBloc(this._databaseRepository) : super(PendingServiceInitial());

  @override
  Stream<PendingServiceState> mapEventToState(
      PendingServiceEvent event) async* {
    if (event is GetPendingService) {
      try {
        yield LoadingPendingService();
        Map<String, dynamic> mp = await _databaseRepository.getPendingServices(
            userID: event.userID, todayDate: event.todayDate);
        yield LoadPendingService(pendingService: mp);
      } catch (e) {
        yield PendingServiceError(message: e.toString());
      }
    }
  }
}
