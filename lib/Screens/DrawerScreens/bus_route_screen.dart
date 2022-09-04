import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class BusRoute extends StatelessWidget {
  const BusRoute({Key? key}) : super(key: key);
  static String id = 'busRoute';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      backgroundColor: kPrimaryColor,
    );
  }
}
