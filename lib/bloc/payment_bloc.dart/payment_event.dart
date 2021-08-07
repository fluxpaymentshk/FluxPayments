import 'package:flux_payments/models/UserService.dart';

abstract class PaymentEvent {
  const PaymentEvent();
}

class GetPendingPayments extends PaymentEvent {
  final String userID;
  const GetPendingPayments(this.userID);
}

class PendingError extends PaymentEvent {
  final String message;
  const PendingError(this.message);
}
