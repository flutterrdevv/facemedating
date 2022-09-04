import 'package:flutter/material.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_datetime_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  static String id = 'meetingScreen';
  TextEditingController subjectController = TextEditingController();
  TextEditingController agendaController = TextEditingController();
  TextEditingController locationController = TextEditingController();
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
          child: Text('Create Meetng'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryDark),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Schedule meet',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                        icon: Icons.subject,
                        hint: 'Subject for the meeting!',
                        label: 'subject',
                        controller: subjectController),
                    CustomTextField(
                        icon: Icons.view_agenda_outlined,
                        hint: 'agenda for meeting(optional)',
                        label: 'agenda',
                        controller: agendaController),
                    CustomTextField(
                        icon: Icons.location_on_outlined,
                        hint: 'choose your location',
                        label: 'location',
                        controller: locationController)
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                buttonName: 'Next',
                height: 50,
                width: 2000,
                function: () {
                  Navigator.pushNamed(context, MeetingDateandTimeScreen.id);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
