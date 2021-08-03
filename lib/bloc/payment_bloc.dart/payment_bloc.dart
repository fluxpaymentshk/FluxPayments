import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_event.dart';
import 'package:flux_payments/bloc/payment_bloc.dart/payment_state.dart';
import 'package:flux_payments/repository/database_repository.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final DatabaseRepository _databaseRepository;
  PaymentBloc(this._databaseRepository) : super(PaymentInitialState());

  @override
  Stream<PaymentState> mapEventToState(PaymentEvent event) async* {}
}
