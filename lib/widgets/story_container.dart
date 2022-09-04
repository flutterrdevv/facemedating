import 'package:flutter/material.dart';
import 'package:tinder/Screens/StoryScreens/story_screen.dart';
import 'package:tinder/widgets/story_widget.dart';

class StoryContainer extends StatelessWidget {
  const StoryContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StoryWidget(
              image: 'assets/stories/1.png',
              name: 'You',
              storyLine: true,
              function: () {
                Navigator.pushNamed(context, StoryScreen.id);
              },
            ),
            StoryWidget(
              image: 'assets/stories/2.png',
              name: 'David',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/3.png',
              name: 'Alex',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/4.png',
              name: 'Mike',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/5.png',
              name: 'Mota',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/7.png',
              name: 'Olivia',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/1.png',
              name: 'You',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/2.png',
              name: 'David',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/3.png',
              name: 'Alex',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/4.png',
              name: 'Mike',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/5.png',
              name: 'Mota',
              storyLine: true,
              function: () {},
            ),
            StoryWidget(
              image: 'assets/stories/7.png',
              name: 'Olivia',
              storyLine: true,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}
