// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Models/UserModel/get_user_info.dart';
import 'package:tinder/constant.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({Key? key}) : super(key: key);
  static String id = 'requestScreen';

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  Map<String, dynamic>? userInfo;
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  GetUserInfo getUserInfo = GetUserInfo();
  List<dynamic> list = [];
  List<dynamic> followers = [];
  List<Map<String, dynamic>>? userData = [];
  final CollectionReference user =
      FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    super.initState();
    function();
  }

  function() {
    var documentSnapshot = user.doc(currentUserId).snapshots();
    documentSnapshot.listen((snapshot) {
      print(">Got data");
      setState(() {
        userData!.clear();
        list = [];
      });
      setState(() {
        userInfo = snapshot.data() as Map<String, dynamic>;
        list = userInfo!['requested'] ?? [];
        print(list);
      });
      followers = userInfo!['followers'] ?? [];
      for (String i in list) {
        getUserInfo.getUser(i).then((value) {
          setState(() {
            userData!.add(value);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text('Request Screen'),
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: kPrimaryColor,
      // body: ListView(
      //   children: userData != null
      //       ? userData!.map((data) {
      //           return list.contains(data['uid'])
      //               ? ListTile(
      //                   textColor: kSecondaryColor,
      //                   title: Text(data['name']),
      //                   subtitle: Text(data['userName']),
      //                   leading: const CircleAvatar(
      //                     radius: 20.0,
      //                     backgroundColor: Colors.white,
      //                     foregroundImage:
      //                         AssetImage('assets/profile/highlights/1.png'),
      //                   ),
      //                   trailing: SizedBox(
      //                     width: 100,
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () {
      //                             deleteRequest(data['uid']);
      //                           },
      //                           child: const Text('delete'),
      //                         ),
      //                         GestureDetector(
      //                             onTap: () {
      //                               acceptRequest(data['uid']);
      //                             },
      //                             child: const Text(
      //                               'Accept',
      //                               style: TextStyle(color: Colors.green),
      //                             )),
      //                       ],
      //                     ),
      //                   ))
      //               : Container();
      //         }).toList()
      //       : [],
      // )
    );
  }

  acceptRequest(uid) async {
    deleteRequest(uid);
    followers.add(uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .update({
          'followers': followers,
        })
        .then((value) => print('user set fors requeted'))
        .onError((error, stackTrace) => print(error));

    getUserInfo.getUser(uid).then((value) async {
      userInfo = value;
      List<dynamic> followings = userInfo!['followings'] ?? [];
      followings.add(currentUserId);
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'followings': followings,
      }).then((value) {
        print('user set for requested');
      }).onError((error, stackTrace) {
        print(error);
      });
    });
  }

  deleteRequest(uid) async {
    list.removeWhere((id) => id == uid);
    setState(() {
      userData!.removeWhere((data) => data['uid'] == uid);
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .update({
      'requested': list,
    }).then((value) {
      print('user set fors requeted');
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
