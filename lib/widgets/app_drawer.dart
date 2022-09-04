import 'package:flutter/material.dart';
import 'package:tinder/Screens/DrawerScreens/bus_route_screen.dart';
import 'package:tinder/Screens/DrawerScreens/connect_screen.dart';
import 'package:tinder/Screens/DrawerScreens/group_screen.dart';
import 'package:tinder/Screens/DrawerScreens/help_srceen.dart';
import 'package:tinder/Screens/DrawerScreens/language_screen.dart';
import 'package:tinder/Screens/DrawerScreens/meeting/meeting_screen.dart';
import 'package:tinder/constant.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key, this.userInfo}) : super(key: key);
  final Map<String, dynamic>? userInfo;

  @override
  Widget build(BuildContext context) {
    final List _drawerMenu = [
      {
        "icon": Icons.info,
        "text": "Group",
        "route": GroupScreen.id,
      },
      {"icon": Icons.route, "text": "Bus Route", "route": BusRoute.id},
      {
        "icon": Icons.schedule,
        "text": "Connect",
        "route": ConnectScreen.id,
      },
      {
        "icon": Icons.feedback_outlined,
        "text": "Meeting",
        "route": MeetingScreen.id,
      },
      {
        "icon": Icons.description_outlined,
        "text": "Language",
        "route": LanguageScreen.id,
      },
      {
        "icon": Icons.description_outlined,
        "text": "Help",
        "route": HelpScreen.id,
      },
    ];
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width * 0.2),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              height: 190.0,
              color: kSecondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    foregroundImage:
                        AssetImage('assets/profile/highlights/1.png'),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        userInfo!['name'] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pushNamed(Profile.profile);
                        },
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text(
                    userInfo!['userName'] ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30))),
                padding: const EdgeInsets.only(
                  top: 20.0,
                ),
                child: ListView(
                  children: _drawerMenu.map((menu) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(menu["route"]);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15,
                          ),
                          title: Text(
                            menu["text"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
