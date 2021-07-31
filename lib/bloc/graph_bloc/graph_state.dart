abstract class GraphState {
  const GraphState();
}

class GraphInitialState extends GraphState {
  const GraphInitialState();
}

class LoadGraphState extends GraphState {
  final Map<String, dynamic> graphData;
  const LoadGraphState({required this.graphData});
}

class LoadingGraphState extends GraphState {
  const LoadingGraphState();
}

class ErrorGraphState extends GraphState {
  final String message;
  const ErrorGraphState({required this.message});
}
