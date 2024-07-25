import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String title;
  final Color textColor;
  final double fontSize;
  final TextAlign textAlign;
  bool isBold;


  CustomText({
  required this.title,
  required this.textColor,
  required this.fontSize,
      required this.textAlign,
       this.isBold = false});

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

