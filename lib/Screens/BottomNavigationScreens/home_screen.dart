// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:tinder/Screens/BottomNavigationScreens/request_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/app_drawer.dart';
import 'package:tinder/widgets/post_widget.dart';
import 'package:tinder/widgets/story_container.dart';
// import 'package:tinder/widgets/story_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.userInfo}) : super(key: key);
  static String id = 'home';
  final Map<String, dynamic>? userInfo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print(widget.userInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: widget.userInfo != null
            ? AppDrawer(userInfo: widget.userInfo)
            : const AppDrawer(),
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Image(
                image: AssetImage('assets/icons/menu.png'),
              ),
            );
          }),
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 14),
              child: Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RequestScreen.id);
                      },
                      icon: const Icon(Icons.notifications)),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Top Stories',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const StoryContainer(),
              Text(
                'My Feeds',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        PostWidget(
                          name: 'David Parker',
                          dp: 'assets/stories/2.png',
                          post: 'man',
                        ),
                        PostWidget(
                          name: 'Mota',
                          dp: 'assets/stories/5.png',
                          post: 'girl',
                        ),
                        PostWidget(
                          name: 'David Parker',
                          dp: 'assets/stories/2.png',
                          post: 'man',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
