import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/ProfileWidgets/profile_header.dart';
import 'package:tinder/widgets/custom_animated_container2.dart';
import 'package:tinder/widgets/custom_switch_button.dart';
import 'package:tinder/widgets/custom_text_switch_button.dart';
import 'package:tinder/widgets/story_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.userInfo}) : super(key: key);
  static String id = 'profileScreen';
  final Map<String, dynamic> userInfo;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Size? size;

  int selectedButton = 1;
  int selectedText = 1;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: const Center(
                    child: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white),
                ))),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Center(
          child: Text('My Profile'),
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileHeader(
                userInfo: widget.userInfo,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.userInfo['name'] ?? '',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'life is all about being happy',
                style: TextStyle(color: kSecondaryColor),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomSwitchButton(
                size: size,
                selectedButton: selectedButton,
                callBack: (slectedSwitchButton) {
                  setState(() {
                    selectedButton = slectedSwitchButton;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        selectedButton == 1
            ? CustomAnimatedContainer1(size: size, selectedText: selectedText)
            : CustomAnimatedContianer2(
                size: size!,
              ),
      ]),
    );
  }
}

class CustomAnimatedContainer1 extends StatelessWidget {
  const CustomAnimatedContainer1({
    Key? key,
    required this.size,
    required this.selectedText,
  }) : super(key: key);

  final Size? size;
  final int selectedText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  StoryWidget(
                      image: 'assets/profile/highlights/1.png',
                      storyLine: true,
                      function: () {}),
                  StoryWidget(
                    image: 'assets/profile/highlights/2.png',
                    storyLine: true,
                    function: () {},
                  ),
                  StoryWidget(
                    image: 'assets/profile/highlights/3.png',
                    storyLine: true,
                    function: () {},
                  ),
                  StoryWidget(
                    image: 'assets/profile/highlights/4.png',
                    storyLine: true,
                    function: () {},
                  ),
                  StoryWidget(
                    image: 'assets/profile/highlights/3.png',
                    storyLine: true,
                    function: () {},
                  ),
                  StoryWidget(
                    image: 'assets/profile/highlights/4.png',
                    storyLine: true,
                    function: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomAnimatedBtton(size: size, selectedButton: selectedText),
            const SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Image(image: AssetImage('assets/profile/girl1.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl2.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl3.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl4.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl5.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl6.png')),
                      ],
                    ),
                    Column(
                      children: const [
                        Image(image: AssetImage('assets/profile/girl4.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl5.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl6.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl1.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl2.png')),
                        SizedBox(
                          height: 8,
                        ),
                        Image(image: AssetImage('assets/profile/girl3.png')),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
