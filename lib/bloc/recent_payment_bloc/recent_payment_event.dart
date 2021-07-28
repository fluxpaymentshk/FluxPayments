abstract class RecentPaymentEvent {
  const RecentPaymentEvent();
}

class GetRecentPaymentDetails extends RecentPaymentEvent {
  final String? userID;
  const GetRecentPaymentDetails({required this.userID});
}
