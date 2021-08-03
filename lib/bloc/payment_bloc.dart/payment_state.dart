abstract class PaymentState {
  const PaymentState();
}

class PaymentInitialState extends PaymentState {
  const PaymentInitialState();
}

class LoadingInternalPayment extends PaymentState {
  const LoadingInternalPayment();
}

class ErrorInternalPayment extends PaymentState {
  final String? message;
  const ErrorInternalPayment(this.message);
}
