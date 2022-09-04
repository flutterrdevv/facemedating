import 'package:flutter/material.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_schedule_done_screen.dart';
import 'package:tinder/constant.dart';

class MeetingAddPeople extends StatelessWidget {
  const MeetingAddPeople({Key? key}) : super(key: key);
  static String id = 'meetingAddPeople';
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MeetingScheduleDOneScreen.id);
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kSecondaryColor)),
                  child: const Center(
                      child: Text(
                    'Next',
                    style: TextStyle(color: Colors.black),
                  ))),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Center(
          child: Text('Add People'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryDark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
