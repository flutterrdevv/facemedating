import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget(
      {Key? key,
      required this.image,
      this.name,
      required this.storyLine,
      required this.function})
      : super(key: key);
  final String? image;
  final String? name;
  final bool? storyLine;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: (() => function()),
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: 48,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: Stack(
                children: [
                  storyLine == true
                      ? const Image(
                          image: AssetImage('assets/stories/6.png'),
                        )
                      : Container(),
                  Center(
                    child: Image(
                      image: AssetImage(image!),
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              ),
            ),
          ),
          name != null
              ? Text(
                  name!,
                  style: TextStyle(color: kSecondaryColor),
                )
              : Container()
        ],
      ),
    );
  }
}
