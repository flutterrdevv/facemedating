// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Models/UserModel/get_user_info.dart';
import 'package:tinder/Screens/ChatScreens/add_users.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:tinder/widgets/custom_textfield.dart';
import '../../Utils/utils.dart';

class GroupName extends StatefulWidget {
  const GroupName({Key? key}) : super(key: key);
  static String id = 'groupName';

  @override
  State<GroupName> createState() => _GroupNameState();
}

class _GroupNameState extends State<GroupName> {
  CollectionReference<Map<String, dynamic>> groups =
      FirebaseFirestore.instance.collection('groups');

  CollectionReference<Map<String, dynamic>> users =
      FirebaseFirestore.instance.collection('users');

  final TextEditingController nameController = TextEditingController();
  List<dynamic>? createdGroups = [];
  List<dynamic>? inGroups = [];
  GetUserInfo getUserInfo = GetUserInfo();
  final String currentUserid = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic>? userData = {};

  @override
  void initState() {
    super.initState();
    getUserInfo.getUser(currentUserid).then((value) {
      userData = value;
      inGroups = userData!['inGroups'];
      createdGroups = userData!['createdGroups'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: const Text('Group Name'),
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                icon: Icons.abc,
                hint: 'Group Name',
                label: 'Group Name',
                controller: nameController),
            const SizedBox(height: 100),
            CustomButton(
                buttonName: 'Add Users',
                function: () {
                  Utils utils = Utils();
                  nameController.text.isNotEmpty
                      ? function(context)
                      : utils.showText('Enter the name of Group');
                })
          ],
        ),
      ),
    );
  }

  function(context) {
    String name = nameController.text;
    String? id;
    try {
      FirebaseFirestore.instance.collection('groups').add({
        'admin': currentUserid,
        'members': [currentUserid],
        'groupName': name
      }).then((value) {
        createdGroups != null ? createdGroups!.add(value.id) : null;
        inGroups != null ? inGroups!.add(value.id) : null;
        id = value.id;

        users
            .doc(currentUserid)
            .update({'createdGroups': createdGroups, 'inGroups': inGroups})
            .then((value) =>
                print('created Group and inGroup fields are updated'))
            .onError((error, stackTrace) => print(error));
        print('Group created');
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AddUsersScreen(
                    docId: id!,
                  )),
        );
      }).onError((error, stackTrace) {
        print(error);
      });
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
