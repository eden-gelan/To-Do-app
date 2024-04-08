import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final EdgeInsets padding;
  final String text;
  final VoidCallback onPressed;

  const ReusableButton({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    required this.padding,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0), // You can customize this
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
