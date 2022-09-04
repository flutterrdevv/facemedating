import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.label,
      required this.controller,
      this.textInputAction,
      this.suffixIcon})
      : super(key: key);
  final String hint;
  final String label;
  final IconData icon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kSecondaryColor, width: 2.0),
            ),
            labelText: label,
            hintText: hint,
            labelStyle: const TextStyle(color: Colors.grey),
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          style: const TextStyle(color: Colors.white),
          controller: controller,
          textInputAction: textInputAction ?? TextInputAction.done,
          autovalidateMode: label == 'Email' ||
                  label == 'Password' ||
                  label == 'Name' ||
                  label == 'User Name'
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          validator: label == 'Email'
              ? (email) => email != null && !EmailValidator.validate(email)
                  ? 'Enter a valid Email'
                  : null
              : label == 'Password'
                  ? (password) => password != null && password.length < 6
                      ? 'Enter min 6 characters'
                      : null
                  : null),
    );
  }
}
