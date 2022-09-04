import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tinder/Models/UserModel/add_user_info.dart';
import 'package:tinder/Screens/AuthScreens/login_screen.dart';
import 'package:tinder/Screens/AuthScreens/success_screen.dart';
import 'package:tinder/widgets/custom_button.dart';
import '../../constant.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key, required this.user})
      : super(key: key);

  final Map<String, dynamic> user;

  static String id = 'emailVerification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  Timer? timer;
  bool isEmailVerified = false;
  bool canResendEmail = false;
  AddUser addUser = AddUser();
  @override
  void initState() {
    addUser.addUser(widget.user);
    verifyEmail();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future verifyEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user
          .sendEmailVerification()
          .then((value) => showText('Email Sent'));
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 10));
      setState(() => canResendEmail = true);
    } on FirebaseAuthException catch (e) {
      showText(e.message!);
    }
  }

  Future checkEmailVerified() async {
    try {
      await FirebaseAuth.instance.currentUser!.reload();
    } on FirebaseAuthException catch (e) {
      showText(e.message!);
    }
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) {
      timer?.cancel();
      Navigator.pushNamed(context, SuccessScreen.id);
    } else {
      showText('Email is not verified yet');
    }
  }

  showText(String text) {
    showToast(
      text,
      duration: const Duration(seconds: 2),
      position: ToastPosition.center,
      backgroundColor: Colors.white.withOpacity(0.8),
      radius: 3.0,
      textStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
      textPadding: const EdgeInsets.all(10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 66, 43, 43),
                    borderRadius: BorderRadius.circular(20)),
                child: const Image(
                  image: AssetImage('assets/icon/text.png'),
                ),
              ),
              // const SizedBox(height: 30),
              // Text.rich(TextSpan(
              //     text: 'Welcome to ',
              //     style: TextStyle(fontSize: 20, color: kSecondaryColor),
              //     children: <InlineSpan>[
              //       TextSpan(
              //         text: 'The Net',
              //         style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: kSecondaryColor),
              //       )
              //     ])),
              const SizedBox(height: 20),
              Text(
                'The verification link has been sent to your email!',
                style: TextStyle(color: kSecondaryColor, fontSize: 17),
              ),
              const SizedBox(height: 80),
              const SizedBox(height: 100),
              CustomButton(
                buttonName: 'Resend Email',
                width: 300,
                height: 50,
                color: canResendEmail ? kSecondaryColor : kPrimaryDark,
                function: () {
                  canResendEmail ? verifyEmail() : null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonName: 'Verification Done',
                width: 300,
                height: 50,
                color: kSecondaryColor,
                function: () {
                  checkEmailVerified();
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                buttonName: 'Cancel',
                width: 300,
                height: 50,
                color: kPrimaryDark,
                function: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
