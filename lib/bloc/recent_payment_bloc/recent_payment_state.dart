abstract class RecentPaymentState {
  const RecentPaymentState();
}

class RecentPaymentInitialState extends RecentPaymentState {
  const RecentPaymentInitialState();
}

class LoadRecentPaymentState extends RecentPaymentState {
  final List<Map<String, dynamic>> RecentPaymentData;
  const LoadRecentPaymentState({required this.RecentPaymentData});
}

class LoadingRecentPaymentState extends RecentPaymentState {
  const LoadingRecentPaymentState();
}

class ErrorRecentPaymentState extends RecentPaymentState {
  final String message;
  const ErrorRecentPaymentState({required this.message});
}
