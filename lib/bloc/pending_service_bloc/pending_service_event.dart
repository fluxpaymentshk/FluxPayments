abstract class PendingServiceEvent {
  const PendingServiceEvent();
}

class GetPendingService extends PendingServiceEvent {
  final String userID, todayDate;
  const GetPendingService({required this.userID, required this.todayDate});
}



