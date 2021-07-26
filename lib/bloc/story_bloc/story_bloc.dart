import 'package:flux_payments/repository/database_repo.dart';
import 'story_event.dart';
import 'story_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flux_payments/models/Story.dart';


class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final DatabaseRepo _databaseRepo;
  StoryBloc(this._databaseRepo) : super(StoryInitialState());

  @override
  Stream<StoryState> mapEventToState(StoryEvent event) async* {
    if (event is GetStory) {
      try {
        yield LoadingStory();

        var story = await _databaseRepo.getStory(
            page: event.page, story: event.story);
        try {
          yield LoadedStory(story: story);
        } catch (e) {
          yield ErrorStory("Unable to load Story List !");
        }
      } catch (e) {
        yield ErrorStory("Unable to load Story List !");
      }
    }
  }
}
