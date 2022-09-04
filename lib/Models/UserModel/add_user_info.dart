// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tinder/Utils/utils.dart';

class AddUser {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  Utils utils = Utils();
  List<String> followers = [];
  List<String> followings = [];
  List<String> requested = [];
  List<String> createdGroups = [];
  List<String> inGroups = [];
  Future addUser(Map<String, dynamic> user) async {
    await users
        .doc(user['uid'])
        .set({
          'uid': user['uid'],
          'name': user['name'],
          'userName': user['userName'],
          'email': user['email'],
          'followers': followers,
          'followings': followings,
          'requested': requested,
          'createdGroups': createdGroups,
          'inGroups': inGroups,
        })
        .then((value) => print("User Added"))
        .catchError((error) {
          print("Failed to add user: $error");
          utils.showText(error.toString());
        });
  }
}
