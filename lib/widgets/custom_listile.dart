import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      this.trailing,
      required this.leading,
      required this.title,
      this.color,
      this.borderColor,
      this.subtitle,
      this.textColor})
      : super(key: key);

  final String title;
  final Widget? trailing;
  final Widget leading;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: leading,
        subtitle: Text(
          subtitle ?? '',
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: trailing ?? Container(),
        title: Text(title),
        textColor: textColor ?? Colors.white,
        iconColor: Colors.white,
        tileColor: color ?? Colors.transparent,
      ),
    );
  }
}
