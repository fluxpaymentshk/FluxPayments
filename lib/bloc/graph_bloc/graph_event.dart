abstract class GraphEvent {
  const GraphEvent();
}

class GetGraphEvent extends GraphEvent {
  final String UserID;
  const GetGraphEvent({required this.UserID});
}

class LoadingGraphEvent extends GraphEvent {
  const LoadingGraphEvent();
}
