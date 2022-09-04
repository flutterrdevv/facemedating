// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tinder/Screens/AuthScreens/login_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static String id = 'forgotPasswordScreen';
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back,
          color: kSecondaryColor,
        ),
        title: Text(
          'Forgot Password',
          style: TextStyle(color: kSecondaryColor),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter your Email to reset Your Password',
                  style: TextStyle(color: kSecondaryColor, fontSize: 17),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                    icon: Icons.email,
                    hint: 'Email',
                    label: 'Email',
                    controller: emailController),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                    buttonName: 'Reset Password',
                    width: 230,
                    height: 50,
                    function: () {
                      resetPassword(context);
                    })
              ],
            ),
          )),
    );
  }

  Future resetPassword(context) async {
    bool flag = true;
    flag == true
        ? showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ))
        : null;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim())
          .then((value) {
        showText('Password Reset Email sent to your Email');
        flag = false;
        Navigator.pushNamed(context, LoginScreen.id);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showText(e.message!);
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
}
