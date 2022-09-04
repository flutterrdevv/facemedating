// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tinder/Screens/AuthScreens/email_verification_screen.dart';
import 'package:tinder/Screens/AuthScreens/login_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/circular_container.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class SignpScreen extends StatefulWidget {
  const SignpScreen({Key? key}) : super(key: key);
  static String id = 'signup';

  @override
  State<SignpScreen> createState() => _SignpScreenState();
}

class _SignpScreenState extends State<SignpScreen> {
  bool isChecked = false;
  final nameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();

    super.dispose();
  }

  bool check(bool b) {
    setState(() {
      isChecked == true ? isChecked = false : true;
    });
    return isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height / 10,
                  margin: const EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 43, 43),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Image(
                    image: AssetImage('assets/icon/text.png'),
                  ),
                ),
                const SizedBox(height: 10),
                // const Text.rich(TextSpan(
                //     text: 'Welcome to ',
                //     style: TextStyle(fontSize: 20, color: Colors.white),
                //     children: <InlineSpan>[
                //       TextSpan(
                //         text: 'The Net',
                //         style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.white),
                //       )
                //     ])),
                const Text(
                  'Sign In to Continue!',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  controller: nameController,
                  icon: Icons.person,
                  hint: 'Full Nmae',
                  label: 'Name',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: userNameController,
                  icon: Icons.person,
                  hint: 'Your user name',
                  label: 'User Name',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: emailController,
                  icon: Icons.email,
                  hint: 'someone@mail.com',
                  label: 'Email',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.lock,
                  hint: 'Password',
                  label: 'Password',
                  suffixIcon: Icons.remove_red_eye_outlined,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextField(
                  controller: confirmPassController,
                  icon: Icons.lock,
                  hint: 'Confirm Password',
                  label: 'Confirm Password',
                  suffixIcon: Icons.remove_red_eye_outlined,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        value: isChecked,
                        onChanged: (b) {
                          setState(() {
                            isChecked = b ?? false;
                          });
                        }),
                    const Expanded(
                      child: Text.rich(TextSpan(
                          text: 'By checking this you agree to ',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'Privacy Policy ',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: 'and ',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ])),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonName: 'Sign up',
                  width: 300,
                  height: 50,
                  function: () {
                    String name = nameController.text.trim();
                    dynamic userName = userNameController.text;
                    name != '' && userName != ''
                        ? signUp(name, userName)
                        : showText('Add your name and User-Name');
                  },
                ),
                const SizedBox(height: 15),
                const Text('OR',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                const SizedBox(height: 5),
                const Text('Continue with',
                    style: TextStyle(color: Colors.grey, fontSize: 17)),
                const SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircularContainer(
                    image: 'assets/logo/linkedin.png',
                  ),
                  CircularContainer(
                    image: 'assets/logo/facebook.png',
                  ),
                  CircularContainer(
                    image: 'assets/logo/insta.png',
                  ),
                ]),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, LoginScreen.id)},
                  child: const Text.rich(TextSpan(
                      text: 'Have an account?  ',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp(String name, dynamic userName) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
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
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then(
        (value) async {
          flag = false;
          String email = user.currentUser!.email!;
          dynamic uid = user.currentUser!.uid;
          Map<String, dynamic> userInfo = {
            'uid': uid,
            'name': name,
            'userName': userName,
            'email': email,
          };
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((builder) => EmailVerificationScreen(
                    user: userInfo,
                  )),
            ),
          );
        },
      );
    } on FirebaseException catch (e) {
      print(e);
      setState(() {
        flag = false;
      });
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
