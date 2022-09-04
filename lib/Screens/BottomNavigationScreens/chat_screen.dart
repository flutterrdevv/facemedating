import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_listile.dart';
import 'package:tinder/widgets/custom_text_switch_button.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({
    Key? key,
  }) : super(key: key);
  static String id = 'chatScreen';
  int selectedButton = 1;
  Size? size;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryDark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: const Icon(Icons.arrow_back),
          actions: const [
            Icon(Icons.chat),
            SizedBox(
              width: 20,
            ),
          ],
          title: const Center(
            child: Text('Messages'),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Chant with your Friends and Enterprenuers',
                    style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(
                      controller: searchController,
                      icon: Icons.search,
                      hint: '',
                      label: 'Search for chat')
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: kPrimaryColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      CustomAnimatedBtton(
                        selectedButton: selectedButton,
                        size: size,
                        text1: 'chats',
                        text2: 'calls',
                      ),
                      CustomListTile(
                        leading: const CircleAvatar(
                          child: Image(image: AssetImage('assets/chat/1.png')),
                        ),
                        title: 'Emiliana',
                        subtitle: 'How long have you been working?',
                        textColor: kSecondaryColor,
                        borderColor: Colors.transparent,
                        trailing: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text(
                            '2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      CustomListTile(
                        leading: const CircleAvatar(
                          child: Image(image: AssetImage('assets/chat/2.png')),
                        ),
                        title: 'Maria',
                        subtitle: 'How do we met?',
                        textColor: kSecondaryColor,
                        borderColor: Colors.transparent,
                        trailing: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      CustomListTile(
                          leading: const CircleAvatar(
                            child:
                                Image(image: AssetImage('assets/chat/3.png')),
                          ),
                          title: 'Victor',
                          subtitle: 'Like Coffee?',
                          textColor: kSecondaryColor,
                          borderColor: Colors.transparent,
                          trailing: Text(
                            '2 min ago',
                            style: TextStyle(color: kSecondaryColor),
                          )),
                      CustomListTile(
                          leading: const CircleAvatar(
                            child:
                                Image(image: AssetImage('assets/chat/4.png')),
                          ),
                          title: 'Alexis',
                          subtitle: 'I am a product designer',
                          textColor: kSecondaryColor,
                          borderColor: Colors.transparent,
                          trailing: Text(
                            '1 min ago',
                            style: TextStyle(color: kSecondaryColor),
                          )),
                      CustomListTile(
                          leading: const CircleAvatar(
                            child:
                                Image(image: AssetImage('assets/chat/5.png')),
                          ),
                          title: 'Mata',
                          subtitle: 'hey you?',
                          textColor: kSecondaryColor,
                          borderColor: Colors.transparent,
                          trailing: Text(
                            '2 min ago',
                            style: TextStyle(color: kSecondaryColor),
                          )),
                      CustomListTile(
                          leading: const CircleAvatar(
                            child:
                                Image(image: AssetImage('assets/chat/6.png')),
                          ),
                          title: 'David',
                          subtitle: 'we are close',
                          textColor: kSecondaryColor,
                          borderColor: Colors.transparent,
                          trailing: Text(
                            '2 min ago',
                            style: TextStyle(color: kSecondaryColor),
                          )),
                      CustomListTile(
                        leading: const CircleAvatar(
                          child: Image(image: AssetImage('assets/chat/1.png')),
                        ),
                        title: 'Emiliana',
                        subtitle: 'How long have you been working?',
                        textColor: kSecondaryColor,
                        borderColor: Colors.transparent,
                        trailing: Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: const Text(
                            '2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
