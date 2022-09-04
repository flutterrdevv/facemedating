import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class Utils {
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
