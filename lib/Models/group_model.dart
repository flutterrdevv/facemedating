// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tinder/Utils/utils.dart';

class GetGroupData {
  CollectionReference groups = FirebaseFirestore.instance.collection('groups');
  Utils utils = Utils();
  Map<String, dynamic>? userData;
  Future<Map<String, dynamic>> getGroupData(dynamic uid) async {
    await groups.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
      try {
        if (documentSnapshot.exists) {
          dynamic doc = documentSnapshot.data();
          userData = {
            'admin': doc['admin'],
            'groupName': doc['groupName'],
            'members': doc['members'],
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
