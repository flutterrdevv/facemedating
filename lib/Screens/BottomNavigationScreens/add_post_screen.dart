import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({
    Key? key,
  }) : super(key: key);
  static String id = 'addPost';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
    );
  }
}
