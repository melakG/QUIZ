
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, Color backGroundColor,
    TextStyle textStyle) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: textStyle,
    ),
    duration: const Duration(seconds: 6),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    behavior: SnackBarBehavior.floating,
    backgroundColor: backGroundColor,
    margin: const EdgeInsets.all(20.0),
    padding: const EdgeInsets.all(15.0),
  ));
}
