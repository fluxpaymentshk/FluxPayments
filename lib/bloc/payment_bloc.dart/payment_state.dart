import 'package:flux_payments/models/UserService.dart';

abstract class PaymentState {
  const PaymentState();
}

class PaymentInitialState extends PaymentState {
  const PaymentInitialState();
}

class LoadingPendingPayment extends PaymentState {
  const LoadingPendingPayment();
}

class LoadedPendingPayments extends PaymentState {
  final List<UserServicePayments> pendingPayments;
  const LoadedPendingPayments(this.pendingPayments);
}

class ErrorPayment extends PaymentState {
  final String? message;
  const ErrorPayment(this.message);
}
