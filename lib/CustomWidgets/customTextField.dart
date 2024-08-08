import 'package:flutter/material.dart';

import '../Resources/resource.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color hintTextColor;
  final IconData? prefixIcon;
  final int maxLines;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.validator,
    required this.keyboardType,
    this.hintTextColor = Colors.grey,
    this.prefixIcon,
    this.maxLines = 1, // Default value for maxLines
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        filled: true,
        fillColor: Resource.colors.feild,
        errorStyle: TextStyle(fontSize: 15.0, color: Resource.colors.mainColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
