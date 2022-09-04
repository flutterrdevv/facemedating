import 'package:flutter/material.dart';
import 'package:tinder/Screens/BottomNavigationScreens/bottom_navigation_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';

class MeetingScheduleDOneScreen extends StatelessWidget {
  const MeetingScheduleDOneScreen({Key? key}) : super(key: key);
  static String id = 'meetingschedule';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: 20,
          ),
        ],
        title: const Center(
          child: Text(''),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: kPrimaryDark),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  buttonName: 'Edit',
                  color: kPrimaryColor,
                  textColor: kSecondaryColor,
                  function: () {
                    Navigator.pushNamed(context, MeetingScreen.id);
                  },
                ),
                CustomButton(
                  buttonName: 'Done',
                  color: kSecondaryColor,
                  textColor: kPrimaryColor,
                  function: () {
                    Navigator.pushNamed(context, BottomNavigationScreen.id);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
