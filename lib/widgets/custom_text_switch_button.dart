import 'package:flutter/material.dart';
import 'package:tinder/constant.dart';

class CustomAnimatedBtton extends StatefulWidget {
  CustomAnimatedBtton(
      {Key? key,
      required this.selectedButton,
      required this.size,
      this.text1,
      this.text2})
      : super(key: key);
  final Size? size;
  int selectedButton;
  String? text1;
  String? text2;
  @override
  State<CustomAnimatedBtton> createState() => _CustomAnimatedBtton();
}

class _CustomAnimatedBtton extends State<CustomAnimatedBtton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size!.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedButton = 1;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2.0, bottom: 2, left: 2),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      widget.text1 ?? "Posts",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: kSecondaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.selectedButton == 1
                        ? Container(
                            height: 2,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kSecondaryColor,
                            ),
                          )
                        : Container(
                            height: 2,
                            width: 80,
                          ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedButton = 2;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2.0, bottom: 2, right: 2),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      widget.text2 ?? "Highlights",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: kSecondaryColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    widget.selectedButton == 2
                        ? Container(
                            height: 2,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kSecondaryColor,
                            ),
                          )
                        : Container(
                            height: 2,
                            width: 80,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
