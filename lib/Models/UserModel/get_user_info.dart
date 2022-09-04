// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tinder/Utils/utils.dart';

class GetUserInfo {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Utils utils = Utils();
  Map<String, dynamic>? userData;
  Future<Map<String, dynamic>> getUser(dynamic uid) async {
    await users.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      try {
        if (documentSnapshot.exists) {
          dynamic doc = documentSnapshot.data();
          userData = {
            'uid': doc['uid'],
            'name': doc['name'],
            'userName': doc['userName'],
            'email': doc['email'],
            'followers': doc['followers'],
            'followings': doc['followings'],
            'requested': doc['requested'],
            'createdGroups': doc['createdGroups'],
            'inGroups': doc['inGroups'],
          };
        }
      } on StateError catch (e) {
        print(e.message);
      }
    }).catchError((error) {
      utils.showText(error);
    });
    // print(userData);
    return userData!;
  }
}


  // Utils utils = Utils();
  // Map<String, dynamic>? userData;
  // Future<Map<String, dynamic>> getUser(dynamic uid) async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .where('uid', isEqualTo: uid)
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     for (var doc in querySnapshot.docs) {
  //       userData = {
  //         'uid': doc['uid'],
  //         'name': doc['name'],
  //         'email': doc['email'],
  //       };
  //     }
  //   }).catchError((error) {
  //     utils.showText(error);
  //   });
  //   return userData!;
  // }
