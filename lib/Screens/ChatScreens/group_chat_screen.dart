// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Models/UserModel/get_user_info.dart';
import 'package:tinder/Screens/ChatScreens/chat_group_info.dart';
import 'package:tinder/widgets/custom_button.dart';

import '../../constant.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({Key? key, required this.groupId}) : super(key: key);
  final String groupId;
  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  CollectionReference<Map<String, dynamic>> groups =
      FirebaseFirestore.instance.collection('groups');
  String currentUserId = FirebaseAuth.instance.currentUser!.uid;
  GetUserInfo getUserInfo = GetUserInfo();
  TextEditingController controller = TextEditingController();
  Stream<QuerySnapshot>? _usersStream;
  String? textMessage;
  String? name;
  Map<String, dynamic>? userData;
  @override
  void initState() {
    getCurrentUserData();
    _usersStream = FirebaseFirestore.instance
        .collection('groups')
        .doc(widget.groupId)
        .collection('conversation')
        .orderBy('time', descending: true)
        .snapshots();
    super.initState();
  }

  getCurrentUserData() {
    getUserInfo.getUser(currentUserId).then((value) {
      userData = value;
      setState(() {
        name = userData!['name'];
      });
    }).onError((error, stackTrace) {
      print(error);
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
        title: const Center(child: Text('Group Chat')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatGroupInfo.id);
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    print('Something went wrong!');
                    return const Text(
                      'Something went wrong',
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData) {
                    print('no data');
                    return const Center(
                        child: Text('Start your conversation!',
                            style: TextStyle(color: Colors.white)));
                  }
                  if (snapshot.hasData) {
                    print('snapshot has data');
                  }

                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        print(data);
                        return BubbleMessages(
                            text: data['text'],
                            sender: data['sender'],
                            isMe: name == data['sender']);
                      }).toList(),
                    ),
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: TextField(
                      controller: controller,
                      decoration: kTextFieldDecoration,
                      style: const TextStyle(color: Colors.white),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        controller.clear();
                        function();
                      },
                      onChanged: (value) {
                        setState(() {
                          textMessage = value;
                        });
                      },
                    ),
                  ),
                  CustomButton(
                      width: 80,
                      height: 40,
                      buttonName: 'send',
                      function: () {
                        function();
                        controller.clear();
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  function() {
    groups
        .doc(widget.groupId)
        .collection('conversation')
        .add({
          'text': textMessage ?? '',
          'sender': name ?? '',
          'time': DateTime.now()
        })
        .then((value) => print('Messege sent'))
        .onError((error, stackTrace) => print(error));
  }
}

class BubbleMessages extends StatelessWidget {
  const BubbleMessages(
      {Key? key, required this.text, required this.sender, required this.isMe})
      : super(key: key);
  final String text;
  final String sender;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 3),
              Material(
                  color: isMe ? Colors.lightBlueAccent : Colors.white,
                  elevation: 5,
                  borderRadius: isMe ? currentUserRadius : otherUsersRadius,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: isMe ? Colors.white : Colors.black,
                          fontSize: 15),
                    ),
                  ))
            ]));
  }
}
