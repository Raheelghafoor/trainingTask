import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String title;
  final Color textColor;
  final double fontSize;
  final TextAlign textAlign;
  final bool isBold;

  const CustomText({
    super.key,
    required this.textColor,
    required this.fontSize,
    required this.textAlign,
    required this.title,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
