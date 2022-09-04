// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Models/UserModel/get_user_info.dart';
import 'package:tinder/Models/group_model.dart';
import 'package:tinder/Screens/ChatScreens/group_chat_screen.dart';
import 'package:tinder/constant.dart';

class GroupsScreen extends StatefulWidget {
  GroupsScreen({Key? key, required this.groupId}) : super(key: key);
  static String id = 'groupChat';
  String groupId;

  @override
  State<GroupsScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupsScreen> {
  List<dynamic>? inGroups = [];
  GetGroupData getGroupData = GetGroupData();
  final String currentUserid = FirebaseAuth.instance.currentUser!.uid;
  List<Map<String, dynamic>>? userData = [];
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');
  Map<String, dynamic>? userInfo;
  List<dynamic>? list = [];
  GetUserInfo getUserInfo = GetUserInfo();

  @override
  void initState() {
    super.initState();
    function();
  }

  function() {
    getUserInfo.getUser(currentUserid).then((value) {
      setState(() {
        userInfo = value;
      });
      list = userInfo!['inGroups'];
      for (String i in list!) {
        print(i);
        getGroupData.getGroupData(i).then((value) {
          setState(() {
            value['groupId'] = i;
            userData!.add(value);
          });
          print('--------userData--------');
          print(userData);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Center(child: Text('Your Groups')),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, ChatGroupInfo.id);
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: ListView(
        children: userData != null
            ? userData!.map((data) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupChatScreen(
                                groupId: data['groupId'],
                              )),
                    );
                  },
                  child: ListTile(
                    textColor: kSecondaryColor,
                    title: Text(data['groupName']),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.white,
                      foregroundImage: AssetImage('assets/images/welcome.PNG'),
                    ),
                  ),
                );
              }).toList()
            : [],
      ),
    );
  }
}
