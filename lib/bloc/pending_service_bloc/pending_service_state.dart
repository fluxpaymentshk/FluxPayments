abstract class PendingServiceState {
  const PendingServiceState();
}

class PendingServiceInitial extends PendingServiceState {
  const PendingServiceInitial();
}

class LoadPendingService extends PendingServiceState {
  final Map<String, dynamic> pendingService;
  const LoadPendingService({required this.pendingService});
}

class LoadingPendingService extends PendingServiceState {
  const LoadingPendingService();
}

class PendingServiceError extends PendingServiceState {
  final String message;
  const PendingServiceError({required this.message});
}
