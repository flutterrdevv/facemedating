import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tinder/Screens/AuthScreens/forgot_password_screen.dart';
import 'package:tinder/Screens/AuthScreens/signup_screen.dart';
import 'package:tinder/Screens/BottomNavigationScreens/bottom_navigation_screen.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import 'package:tinder/widgets/custom_listile.dart';
import 'package:tinder/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool check(bool b) {
    setState(() {
      isChecked == true ? isChecked = false : true;
    });
    return isChecked;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const BottomNavigationScreen();
          } else {
            return SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 15),
                      // const Text.rich(TextSpan(
                      //     text: 'Welcome to ',
                      //     style: TextStyle(fontSize: 20, color: Colors.white),
                      //     children: <InlineSpan>[
                      // TextSpan(
                      //   text: 'The Net',
                      //   style: TextStyle(
                      //       fontSize: 20,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white),
                      // )
                      // ])),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 66, 43, 43),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Image(
                          image: AssetImage('assets/icon/text.png'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Sign In to Continue!',
                        style: TextStyle(color: Colors.white),
                      ),
                      // const SizedBox(height: 15),
                      Container(
                        height: 190,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Checkbox(
                              activeColor: Colors.white,
                              checkColor: Colors.black,
                              fillColor:
                                  MaterialStateProperty.all(Colors.white),
                              value: isChecked,
                              onChanged: (b) {
                                setState(() {
                                  isChecked = b ?? false;
                                });
                              }),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: 150,
                            child: const Text(
                              'Remeber me',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, ForgotPasswordScreen.id),
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        buttonName: 'Sign In',
                        width: 300,
                        height: 50,
                        function: () {
                          signIn();
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text('OR',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      const SizedBox(height: 10),
                      const CustomListTile(
                        title: 'login with Linkedin',
                        leading: Image(
                            image: AssetImage('assets/logo/linkedin.png')),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ),
                      const CustomListTile(
                        title: 'login with Facebook',
                        leading: Image(
                            image: AssetImage('assets/logo/facebook.png')),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ),
                      const CustomListTile(
                        title: 'login with Instagram',
                        leading:
                            Image(image: AssetImage('assets/logo/insta.png')),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15,
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () =>
                            {Navigator.pushNamed(context, SignpScreen.id)},
                        child: const Text.rich(TextSpan(
                            text: 'Dont have an account?  ',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'Sign up',
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
            );
          }
        },
      ),
    );
  }

  Future signIn() async {
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
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((value) {
        flag = false;
        Navigator.pushNamed(context, BottomNavigationScreen.id);
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showToast(
        '${e.message}',
        duration: const Duration(seconds: 2),
        position: ToastPosition.center,
        backgroundColor: Colors.white.withOpacity(0.8),
        radius: 3.0,
        textStyle: const TextStyle(fontSize: 18.0, color: Colors.black),
        textPadding: const EdgeInsets.all(10),
      );
      setState(() {
        flag = false;
      });
    }
  }
}
