import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

import '../../Models/UserModel/get_user_info.dart';
import 'add_post_screen.dart';
import 'chat_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);
  static String id = 'navigaationScreenId';

  @override
  State<BottomNavigationScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomNavigationScreen> {
  final PageController controller = PageController(initialPage: 0);
  var pageIndex = 0;
  GetUserInfo getUser = GetUserInfo();
  final user = FirebaseAuth.instance;
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    getUser.getUser(user.currentUser!.uid).then((value) {
      setState(() {
        userInfo = value;
        print(userInfo);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens(Map<String, dynamic> userInfo) {
      return [
        HomeScreen(
          userInfo: userInfo,
        ),
        SearchScreen(),
        const AddPostScreen(),
        ChatScreen(),
        ProfileScreen(
          userInfo: userInfo,
        ),
      ];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        children: userInfo != null ? buildScreens(userInfo!) : buildScreens({}),
      ),
      bottomNavigationBar: CustomNavigationBar(
          backgroundColor: kPrimaryColor,
          scaleFactor: 0.2,
          scaleCurve: Curves.linear,
          bubbleCurve: Curves.linear,
          selectedColor: kSecondaryColor,
          strokeColor: kPrimaryColor,
          elevation: 16,
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
              controller.animateToPage(pageIndex,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.linearToEaseOut);
            });
          },
          iconSize: 29,
          items: [
            CustomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/icons/home.png'),
              ),
            ),
            CustomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/icons/search.png'),
              ),
            ),
            CustomNavigationBarItem(
              icon: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(Icons.add, color: Colors.white)),
            ),
            CustomNavigationBarItem(
              icon: const Image(
                image: AssetImage('assets/icons/email.png'),
              ),
            ),
            CustomNavigationBarItem(
              icon: const CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('assets/profile/highlights/1.png'),
              ),
            ),
          ]),
    );
  }
}
