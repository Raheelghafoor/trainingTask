import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final bool isBold;
  final double borderRadius;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.fontSize,
    this.isBold = false,
    required this.borderRadius,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(
            vertical: height * 0.2,
            horizontal: width * 0.1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
