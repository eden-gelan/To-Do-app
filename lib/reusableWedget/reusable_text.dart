import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;

  const ReusableText({
    super.key,
    required this.text,
    required this.fontWeight,
    required this.color,
    required this.fontSize,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
