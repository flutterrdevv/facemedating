import 'package:flutter/material.dart';

class CircularContainer extends StatelessWidget {
  CircularContainer(
      {required this.image,
      Key? key,
      this.height,
      this.width,
      this.borderColor})
      : super(key: key);
  final String image;
  final double? width;
  final double? height;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: height ?? 40,
      width: width ?? 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: borderColor ?? Colors.grey)),
      child: Image(image: AssetImage(image)),
    );
  }
}
