import 'package:flux_payments/models/Story.dart';

abstract class StoryState {
  const StoryState();
}

class StoryInitialState extends StoryState {
  const StoryInitialState();
}

class LoadingStory extends StoryState {
  const LoadingStory();
}

class LoadedStory extends StoryState {
  final List<Story> story;
  const LoadedStory({required this.story});
}

class ErrorStory extends StoryState {
  final String? message;
  const ErrorStory(this.message);
} 