import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  final String placeholder;
  final Color borderColor;
  final double borderRadius;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const ReusableTextField({
    Key? key,
    required this.placeholder,
    required this.borderColor,
    required this.borderRadius,
    this.controller,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
