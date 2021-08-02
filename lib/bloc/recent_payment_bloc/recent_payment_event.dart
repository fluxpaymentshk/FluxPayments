abstract class RecentPaymentEvent {
  const RecentPaymentEvent();
}

class GetRecentPaymentDetails extends RecentPaymentEvent {
  final String? userID;
  //final int order;//1 weekly, 2 monthly , 3 yearly
  const GetRecentPaymentDetails({required this.userID});
}
