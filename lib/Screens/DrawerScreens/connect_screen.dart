// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Models/UserModel/get_user_info.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);
  static String id = 'connectScreen';
  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  bool isPressed = true;
  GetUserInfo getUserInfo = GetUserInfo();
  Map<String, dynamic>? userInfo;
  List<String>? toRequested;
  final String currentUserid = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic>? userData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text('Connect with people'),
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return currentUserid != data['uid'] &&
                      !(data['followers'] as List).contains(currentUserid) &&
                      !(data['followings'] as List).contains(currentUserid)
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
                      trailing: !(data['requested'] as List)
                              .contains(currentUserid)
                          ? CustomButton(
                              buttonName: 'Connect',
                              function: () {
                                onPressed(data['uid'], getUserInfo, userInfo);
                              },
                              width: 90,
                              height: 30,
                              color: kSecondaryColor,
                            )
                          : CustomButton(
                              buttonName: 'Requested',
                              function: () async {
                                List<dynamic> requested = data['requested'];
                                requested
                                    .removeWhere((id) => id == currentUserid);
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(data['uid'])
                                    .update({
                                      'requested': requested,
                                    })
                                    .then((value) =>
                                        print('user set for requested'))
                                    .onError(
                                        (error, stackTrace) => print(error));
                              },
                              width: 90,
                              height: 30,
                              color: kPrimaryDark,
                            ),
                    )
                  : Container();
            }).toList(),
          );
        },
      ),
    );
  }
}

onPressed(uid, GetUserInfo getUserInfo, Map<String, dynamic>? userInfo) async {
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  getUserInfo.getUser(uid).then((value) async {
    userInfo = value;
    List<dynamic> requested = userInfo!['requested'] ?? [];
    requested.add(currentUserId);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
          'requested': requested,
        })
        .then((value) => print('user set for requested'))
        .onError((error, stackTrace) => print(error));
  }).onError((error, stackTrace) {
    print(error);
  });
}
