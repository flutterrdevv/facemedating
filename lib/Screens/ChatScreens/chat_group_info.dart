// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Screens/ChatScreens/add_users.dart';
import '../../Models/UserModel/get_user_info.dart';
import '../../constant.dart';

class ChatGroupInfo extends StatefulWidget {
  const ChatGroupInfo({Key? key}) : super(key: key);
  static String id = 'chatGroupInfo';
  @override
  State<ChatGroupInfo> createState() => _ChatGroupInfoState();
}

class _ChatGroupInfoState extends State<ChatGroupInfo> {
  Map<String, dynamic>? userInfo;
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  GetUserInfo getUserInfo = GetUserInfo();
  List<dynamic>? list = [];
  List<dynamic>? addChatUsers = [];
  List<Map<String, dynamic>>? userData = [];
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    function();
    super.initState();
  }

  function() {
    var documentSnapshot = user.doc(currentUserId).snapshots();
    documentSnapshot.listen(
      (snapshot) {
        setState(() {
          userData!.clear();
        });
        userInfo = snapshot.data() as Map<String, dynamic>;
        list = userInfo!['chatGroup'] ?? [];
        for (String i in list!) {
          getUserInfo.getUser(i).then((value) {
            setState(() {
              userData!.add(value);
            });
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back),
        title: const Center(child: Text('Group Information')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddUsersScreen.id);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: userData != null
            ? userData!.map((data) {
                return (userInfo!['chatGroup'] as List<dynamic>)
                        .contains(data['uid'])
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
                            removeUser(data['uid']);
                          },
                          child: const Text(
                            'remove',
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

  removeUser(uid) async {
    list!.remove(uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .update({
          'chatGroup': addChatUsers,
        })
        .then((value) => print('user set fors requeted'))
        .onError((error, stackTrace) => print(error));
  }
}
