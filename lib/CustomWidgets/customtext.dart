import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String title;
  final Color textColor;
  final double fontSize;
  final TextAlign textAlign;
  final bool isBold;


  CustomText({
  required this.title,
  required this.textColor,
  required this.fontSize,
      required this.textAlign,
      required this.isBold});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: isBold ? FontWeight.bold :FontWeight.normal

      ),

    );
  }
}

