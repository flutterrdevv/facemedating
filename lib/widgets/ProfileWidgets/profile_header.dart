import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
    required this.userInfo,
  }) : super(key: key);
  final Map<String, dynamic> userInfo;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              (userInfo['followers'] as List).length.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Followers', style: TextStyle(color: kSecondaryColor))
          ],
        ),
        const CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.white,
          foregroundImage: AssetImage('assets/profile/highlights/1.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              (userInfo['followings'] as List).length.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('Followings', style: TextStyle(color: kSecondaryColor))
          ],
        )
      ],
    );
  }
}
