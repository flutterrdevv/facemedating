// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Screens/ChatScreens/groups_screen.dart';
import '../../Models/UserModel/get_user_info.dart';
import '../../constant.dart';

class AddUsersScreen extends StatefulWidget {
  const AddUsersScreen({
    Key? key,
    required this.docId,
  }) : super(key: key);
  static String id = 'addUserScreen';
  final String docId;
  @override
  State<AddUsersScreen> createState() => _AddUsersScreenState();
}

class _AddUsersScreenState extends State<AddUsersScreen> {
  Map<String, dynamic>? userInfo;
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  GetUserInfo getUserInfo = GetUserInfo();
  List<dynamic> list = [];
  List<Map<String, dynamic>>? userData = [];
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  TextEditingController nameController = TextEditingController();
  List<dynamic>? members = [];
  Map<String, dynamic>? groupData = {};
  CollectionReference<Map<String, dynamic>> groups =
      FirebaseFirestore.instance.collection('groups');
  List<dynamic>? usersInGroup = [];
  Map<String, dynamic>? otherUserData = {};

  @override
  void initState() {
    function();
    getGroupData();
    super.initState();
    print(widget.docId);
    print('----------');
  }

  function() {
    var documentSnapshot = users.doc(currentUserId).snapshots();
    documentSnapshot.listen(
      (snapshot) {
        setState(() {
          userData!.clear();
        });
        userInfo = snapshot.data() as Map<String, dynamic>;
        list = userInfo!['followers'] ?? [];
        for (dynamic element in userInfo!['followings'] as List<dynamic>) {
          list.add(element);
        }
        for (String i in list) {
          getUserInfo.getUser(i).then((value) {
            setState(() {
              userData!.add(value);
            });
          });
        }
      },
    );
  }

  getGroupData() {
    var documentSnapshot = groups.doc(widget.docId).snapshots();
    documentSnapshot.listen((snapshot) {
      setState(() {
        groupData!.clear();
      });
      groupData = snapshot.data() as Map<String, dynamic>;
      print(groupData);
      members = groupData!['members'];
    });
  }

  getItherUserData(otherUserid) {
    getUserInfo.getUser(otherUserid).then((value) {
      setState(() {
        otherUserData = value;
        otherUserData != null
            ? usersInGroup = otherUserData!['inGroups']
            : null;
      });
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
          title: const Text('Add Members'),
          actions: [
            IconButton(
                onPressed: () {
                  groups
                      .doc(widget.docId)
                      .collection('conversation')
                      .add({'text': '', 'sender': ''}).then((value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GroupsScreen(
                                groupId: widget.docId,
                              )),
                    );
                  });
                },
                icon: const Icon(Icons.done_outline_rounded))
          ]),
      body: ListView(
        children: userData != null
            ? userData!.map((data) {
                getItherUserData(data['uid']);
                return !(groupData != null
                        ? members!.contains(data['uid'])
                        : true)
                    ? ListTile(
                        textColor: kSecondaryColor,
                        title: Text(data['name']),
                        subtitle: Text(data['userName']),
                        leading: const CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.white,
                          foregroundImage:
                              AssetImage('assets/profile/highlights/1.png'),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            acceptRequest(
                              data['uid'],
                            );
                          },
                          child: const Text(
                            'Add',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      )
                    : Container();
              }).toList()
            : [],
      ),
    );
  }

  acceptRequest(uid) async {
    members!.add(uid);
    usersInGroup!.add(widget.docId);
    groups
        .doc(widget.docId)
        .update({'members': members})
        .then((value) => print('user set for requeted'))
        .onError((error, stackTrace) => print(error));
    users
        .doc(uid)
        .update({'inGroups': usersInGroup})
        .then((value) => print('usersInGroup updated'))
        .onError((error, stackTrace) => print('error'));
  }
}
