import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Screens/AuthScreens/login_screen.dart';
import 'package:tinder/widgets/custom_button.dart';

class CustomAnimatedContianer2 extends StatelessWidget {
  const CustomAnimatedContianer2({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.maybeOf(context)!.size.height / 4,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomRow(
                    leading: 'Location',
                    trailing: 'Dallax, Texas',
                  ),
                  CustomRow(
                    leading: 'Profession',
                    trailing: 'UX, Designer',
                  ),
                  CustomRow(
                    leading: 'Email',
                    trailing: 'Email@email.com',
                  ),
                  CustomRow(
                    leading: 'Categories',
                    trailing: 'Arts, Graphic designer',
                  ),
                  CustomRow(
                    leading: 'Birthday',
                    trailing: '21-Feb-1996',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomSocialWidget(
                    text: 'LinkedIn',
                    color: Colors.blue,
                    image: 'assets/logo/linkedin.png',
                  ),
                  CustomSocialWidget(
                    text: 'InstaGram',
                    color: Colors.orange,
                    image: 'assets/logo/insta.png',
                  ),
                  CustomSocialWidget(
                    text: 'Facebook ',
                    color: Colors.blue,
                    image: 'assets/logo/facebook.png',
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            CustomButton(
              buttonName: 'Log out',
              width: 200,
              height: 50,
              color: Colors.transparent,
              textColor: Colors.grey,
              function: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

class CustomSocialWidget extends StatelessWidget {
  const CustomSocialWidget({
    Key? key,
    required this.color,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String image;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 40,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
          Image(image: AssetImage(image))
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({Key? key, required this.leading, required this.trailing})
      : super(key: key);
  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        leading,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
      Text(
        trailing,
        style: const TextStyle(color: Colors.grey, fontSize: 15),
      )
    ]);
  }
}
