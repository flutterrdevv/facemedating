import 'package:flutter/material.dart';
import 'package:tinder/Models/StoryModels/story_data.dart';
import 'package:tinder/Screens/AuthScreens/email_verification_Screen.dart';
import 'package:tinder/Screens/AuthScreens/forgot_password_screen.dart';
import 'package:tinder/Screens/AuthScreens/success_screen.dart';
import 'package:tinder/Screens/BottomNavigationScreens/bottom_navigation_screen.dart';
import 'package:tinder/Screens/BottomNavigationScreens/request_screen.dart';
import 'package:tinder/Screens/ChatScreens/add_users.dart';
import 'package:tinder/Screens/ChatScreens/chat_group_info.dart';
import 'package:tinder/Screens/ChatScreens/groups_screen.dart';
import 'package:tinder/Screens/ChatScreens/group_name_screen.dart';
import 'package:tinder/Screens/DrawerScreens/bus_route_screen.dart';
import 'package:tinder/Screens/DrawerScreens/connect_screen.dart';
import 'package:tinder/Screens/DrawerScreens/group_screen.dart';
import 'package:tinder/Screens/DrawerScreens/help_srceen.dart';
import 'package:tinder/Screens/DrawerScreens/language_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_addpeople_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_datetime_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_schedule_done_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_screen.dart';
import 'package:tinder/Screens/StoryScreens/story_screen.dart';
import 'Screens/AuthScreens/login_screen.dart';
import 'Screens/AuthScreens/signup_screen.dart';
import 'Screens/welcome_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  BottomNavigationScreen.id: (context) => const BottomNavigationScreen(),
  WelcomeScreen.id: (context) => const WelcomeScreen(),
  LoginScreen.id: (context) => const LoginScreen(),
  SignpScreen.id: (context) => const SignpScreen(),
  EmailVerificationScreen.id: (context) => const EmailVerificationScreen(
        user: {},
      ),
  SuccessScreen.id: (context) => const SuccessScreen(),
  BusRoute.id: (context) => const BusRoute(),
  ConnectScreen.id: (context) => const ConnectScreen(),
  GroupScreen.id: (context) => const GroupScreen(),
  HelpScreen.id: (context) => const HelpScreen(),
  LanguageScreen.id: (context) => const LanguageScreen(),
  MeetingScreen.id: (context) => MeetingScreen(),
  MeetingDateandTimeScreen.id: (context) => const MeetingDateandTimeScreen(),
  MeetingAddPeople.id: (context) => const MeetingAddPeople(),
  MeetingScheduleDOneScreen.id: (context) => const MeetingScheduleDOneScreen(),
  StoryScreen.id: (context) => StoryScreen(
        stories: stories,
      ),
  ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
  RequestScreen.id: (context) => const RequestScreen(),
  AddUsersScreen.id: (context) => const AddUsersScreen(
        docId: '',
      ),
  GroupsScreen.id: (context) => GroupsScreen(
        groupId: '',
      ),
  ChatGroupInfo.id: (context) => const ChatGroupInfo(),
  GroupName.id: (context) => const GroupName(),
};
