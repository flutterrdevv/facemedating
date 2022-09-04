import 'package:flutter/material.dart';

Color kPrimaryColor = const Color(0xFF200D0D);
Color kSecondaryColor = const Color(0xFFDFA100);
Color kPrimaryDark = const Color(0xFF3F3131);
Color kLogoColor = const Color.fromARGB(255, 66, 43, 43);
var kTextFieldDecoration = InputDecoration(
  border: const OutlineInputBorder(),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kSecondaryColor, width: 1.0),
  ),
  hintText: 'Enter your Message',
  labelStyle: const TextStyle(color: Colors.grey),
  hintStyle: const TextStyle(color: Colors.grey),
);
const currentUserRadius = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
const otherUsersRadius = BorderRadius.only(
  topRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);
