import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/story_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    required this.dp,
    required this.name,
    required this.post,
    Key? key,
  }) : super(key: key);
  final String name;
  final String post;
  final String dp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ListTile(
          leading: Container(
              width: 50,
              child: StoryWidget(
                image: dp,
                storyLine: false,
                function: () {},
              )),
          trailing: Icon(
            Icons.more_vert,
            color: kSecondaryColor,
          ),
          title: Text(
            name,
            style:
                TextStyle(color: kSecondaryColor, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            '30 sec ago',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/$post.png')),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.thumb_up,
                color: kSecondaryColor,
              ),
              Icon(
                Icons.comment_rounded,
                color: kSecondaryColor,
              ),
              Icon(
                Icons.share,
                color: kSecondaryColor,
              )
            ],
          ),
        )
      ]),
    );
  }
}
