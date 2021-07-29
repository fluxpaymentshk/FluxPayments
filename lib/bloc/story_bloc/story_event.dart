import 'package:flux_payments/models/Story.dart';
import 'package:flux_payments/models/ModelProvider.dart';

abstract class StoryEvent {
  const StoryEvent();
}

class GetStory extends StoryEvent {
  final List<Story> story;
  final int page;
  const GetStory({required this.page, required this.story});
}
