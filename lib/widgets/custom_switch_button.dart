import 'package:flutter/material.dart';

import '../constant.dart';

class CustomSwitchButton extends StatefulWidget {
  CustomSwitchButton(
      {Key? key,
      required this.selectedButton,
      required this.size,
      required this.callBack})
      : super(key: key);
  final Size? size;
  int selectedButton;
  final Function callBack;

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: widget.size!.height * 0.07,
      width: widget.size!.width * 0.613,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 3.0, color: Colors.grey, spreadRadius: 2)
        ],
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedButton = 1;
                widget.callBack(widget.selectedButton);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2.0, bottom: 2, left: 2),
              height: widget.size!.height * 0.07,
              width: widget.size!.width * 0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: widget.selectedButton == 1
                      ? kPrimaryColor
                      : Colors.white),
              child: Center(
                child: Text(
                  "Posts",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: widget.selectedButton == 1
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedButton = 2;
                widget.callBack(widget.selectedButton);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(top: 2.0, bottom: 2, right: 2),
              height: widget.size!.height * 0.07,
              width: widget.size!.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color:
                    widget.selectedButton == 2 ? kPrimaryColor : Colors.white,
              ),
              child: Center(
                child: Text(
                  "About You",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: widget.selectedButton == 2
                          ? Colors.white
                          : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
