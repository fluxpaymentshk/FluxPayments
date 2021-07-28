import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_event.dart';
import 'package:flux_payments/bloc/recent_payment_bloc/recent_payment_state.dart';
import 'package:flux_payments/repository/database_repository.dart';

class RecentPaymentBloc extends Bloc<RecentPaymentEvent, RecentPaymentState> {
  final DatabaseRepository _databaseRepository;
  RecentPaymentBloc(this._databaseRepository)
      : super(RecentPaymentInitialState());

  @override
  Stream<RecentPaymentState> mapEventToState(RecentPaymentEvent event) async* {
    if (event is GetRecentPaymentDetails) {
      try {
        yield LoadingRecentPaymentState();
        List<Map<String, dynamic>> details = await _databaseRepository
            .getRecentPayments(UserID: event.userID ?? '');
        yield LoadRecentPaymentState(RecentPaymentData: details);
      } catch (e) {
        yield ErrorRecentPaymentState(message: 'Unable to load details!');
      }
    }
  }
}
