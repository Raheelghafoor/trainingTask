import 'package:flutter/material.dart';
import 'package:traning_task/Resource/resources.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final Color hintTextColor;
  final Color labelTextColor; // Add this parameter

  CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    this.validator,
    required this.keyboardType,
    this.hintTextColor = Colors.grey,
    this.labelTextColor = Colors.black, // Default to black
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(color: labelTextColor),
        ),
        SizedBox(height: 5.0),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: hintTextColor),
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
        ),
      ],
    );
  }
}