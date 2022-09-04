import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';
import 'package:tinder/widgets/custom_button.dart';
import '../ChatScreens/groups_screen.dart';
import '../ChatScreens/group_name_screen.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);
  static String id = 'groupScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: const [
            Icon(Icons.search),
            SizedBox(
              width: 20,
            ),
          ],
          title: const Center(
            child: Text('Groups'),
          ),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    buttonName: 'Create Group',
                    function: () {
                      Navigator.pushNamed(context, GroupName.id);
                    }),
                CustomButton(
                    buttonName: 'Grop chats',
                    function: () {
                      Navigator.pushNamed(context, GroupsScreen.id);
                    }),
              ],
            ),
          ),
        ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:tinder/constant.dart';
// import 'package:tinder/widgets/custom_listile.dart';
// import 'package:tinder/widgets/custom_text_switch_button.dart';

// class GroupScreen extends StatelessWidget {
//   GroupScreen({Key? key}) : super(key: key);
//   static String id = 'groupScreen';
//   int selectedButton = 1;
//   Size? size;
//   @override
//   Widget build(BuildContext context) {
//     size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         shadowColor: Colors.transparent,
//         leading: const Icon(Icons.arrow_back),
//         actions: const [
//           Icon(Icons.search),
//           SizedBox(
//             width: 20,
//           ),
//         ],
//         title: const Center(
//           child: Text('Groups'),
//         ),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(children: [
//           CustomAnimatedBtton(
//             selectedButton: selectedButton,
//             size: size,
//             text1: 'Groups',
//             text2: 'Topics',
//           ),
//           CustomListTile(
//             leading: const CircleAvatar(
//               child: Image(image: AssetImage('assets/chat/1.png')),
//             ),
//             title: 'Uix Mentorship',
//             subtitle: 'How long have you been waiting?',
//             textColor: kSecondaryColor,
//             borderColor: Colors.transparent,
//             trailing: Container(
//               alignment: Alignment.center,
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: kSecondaryColor),
//               child: const Text(
//                 '3',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           CustomListTile(
//             leading: const CircleAvatar(
//               child: Image(image: AssetImage('assets/chat/1.png')),
//             ),
//             title: 'Uix Mentorship',
//             subtitle: 'How long have you been waiting?',
//             textColor: kSecondaryColor,
//             borderColor: Colors.transparent,
//             trailing: Container(
//               alignment: Alignment.center,
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: kSecondaryColor),
//               child: const Text(
//                 '3',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           CustomListTile(
//             leading: const CircleAvatar(
//               child: Image(image: AssetImage('assets/chat/1.png')),
//             ),
//             title: 'Uix Mentorship',
//             subtitle: 'How long have you been waiting?',
//             textColor: kSecondaryColor,
//             borderColor: Colors.transparent,
//             trailing: Container(
//               alignment: Alignment.center,
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: kSecondaryColor),
//               child: const Text(
//                 '3',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           CustomListTile(
//             leading: const CircleAvatar(
//               child: Image(image: AssetImage('assets/chat/1.png')),
//             ),
//             title: 'Uix Mentorship',
//             subtitle: 'How long have you been waiting?',
//             textColor: kSecondaryColor,
//             borderColor: Colors.transparent,
//             trailing: Container(
//               alignment: Alignment.center,
//               height: 20,
//               width: 20,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: kSecondaryColor),
//               child: const Text(
//                 '3',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
