import 'package:flutter/material.dart';
import 'package:training_task/Resources/resources.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final VoidCallback? onSuffixIconPressed;
  final Color hintTextColor;
  final Color prefixIconColor;
  final Color suffixIconColor;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    this.validator,
    required this.keyboardType,
    this.onSuffixIconPressed,
    this.hintTextColor = Colors.grey,
    this.prefixIconColor = Colors.grey,
    this.suffixIconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: prefixIconColor)
            : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: suffixIconColor),
          onPressed: onSuffixIconPressed,
        )
            : null,
        filled: true,
        fillColor: Resources.colors.gray,
        errorStyle: TextStyle(fontSize: 15.0, color: Resources.colors.mainColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
