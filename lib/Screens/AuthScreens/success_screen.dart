import 'package:flutter/material.dart';
import 'package:tinder/Screens/BottomNavigationScreens/bottom_navigation_screen.dart';
import 'package:tinder/constant.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);
  static String id = 'success';

  @override
  State<SuccessScreen> createState() => _SuccessScreen();
}

class _SuccessScreen extends State<SuccessScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushNamed(context, BottomNavigationScreen.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: kPrimaryDark),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                  Text(
                    'Your account has been created successfully',
                    style: TextStyle(color: kSecondaryColor, fontSize: 18),
                  )
                ],
              )),
        ));
  }
}
