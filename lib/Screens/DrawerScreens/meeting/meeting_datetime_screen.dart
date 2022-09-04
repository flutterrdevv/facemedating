import 'package:flutter/material.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_addpeople_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDateandTimeScreen extends StatelessWidget {
  const MeetingDateandTimeScreen({Key? key}) : super(key: key);
  static String id = 'meetingScreenDateandTime';
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
        title: const Center(
          child: Text('Date and Time'),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryDark),
                child: SfCalendar(
                  cellBorderColor: Colors.white,
                  todayHighlightColor: kSecondaryColor,
                )),
            const SizedBox(
              height: 40,
            ),
            CustomButton(
                buttonName: 'Next',
                height: 50,
                width: 2000,
                function: () {
                  Navigator.pushNamed(context, MeetingAddPeople.id);
                })
          ],
        ),
      ),
    );
  }
}
