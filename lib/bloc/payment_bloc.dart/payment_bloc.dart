import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_event.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_state.dart';
import 'package:flux_payments/models/UserService.dart';
import 'package:flux_payments/repository/database_repository.dart';
import 'package:intl/intl.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final DatabaseRepository _databaseRepository;
  PaymentBloc(this._databaseRepository) : super(PaymentInitialState());
  List<UserServicePayments> pendingServicePayments = [];
  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {
    yield PaymentInitialState();
    if (event is GetPendingPayments) {
      yield LoadingPendingPayment();
      try {
        DateTime d = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(d);
        pendingServicePayments =
            await _databaseRepository.getPendingUserServicesPaymentInfo(
          userID: event.userID,
          date: formattedDate,
        );
        yield LoadedPendingPayments(pendingServicePayments);
      } catch (e) {}
    }
  }
}
