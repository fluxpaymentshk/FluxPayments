import 'package:flutter/material.dart';
import 'package:flux_payments/models/Story.dart';
import 'package:story_view/story_view.dart';

class StoryPageView extends StatefulWidget {
  StoryPageView(this.story);
  final List<Story> story;
  @override
  _StoryPageViewState createState() => _StoryPageViewState();
}

class _StoryPageViewState extends State<StoryPageView> {
  final controller = StoryController();
  List<Story> story = [];
  List<StoryItem> storyItem = [];

  @override
  void initState() {
    story = widget.story;
    for (int i = 0; i < story.length; i++) {
      print(story[i].text.toString());
      if (story[i].text != null) {
        storyItem.add(
          StoryItem.text(
              title: story[i].text!, backgroundColor: Colors.blueGrey),
        );
      } else {
        storyItem.add(
          StoryItem.pageImage(
            url: story[i].url.toString(),
            controller: controller,
            caption: story[i].caption,
          ),
        );
      }
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<StoryItem> storyItems = [
      StoryItem.text(
          title: '''“When you talk, you are only repeating something you know.
       But if you listen, you may learn something new.” 
       – Dalai Lama''', backgroundColor: Colors.blueGrey),
      StoryItem.pageImage(
          caption: "Helllo",
          url:
              "https://images.unsplash.com/photo-1553531384-cc64ac80f931?ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8bW91bnRhaW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          controller: controller),
      StoryItem.pageImage(
          url: "https://wp-modula.com/wp-content/uploads/2018/12/gifgif.gif",
          controller: controller,
          imageFit: BoxFit.contain),
    ];
    return Material(
      child: StoryView(
        storyItems: storyItem,
        controller: controller,
        inline: false,
        repeat: true,
      ),
    );
  }
}
