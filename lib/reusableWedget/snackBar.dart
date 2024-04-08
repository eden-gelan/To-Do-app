import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String text,
  IconData? icon, // Optional icon
  Color textColor = Colors.white, // Default text color
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.white,
      content: Row(
        // Arrange icon and text side-by-side
        mainAxisSize: MainAxisSize.min, // Minimize space occupied
        children: [
          if (icon != null) // Only show icon if provided
            Icon(icon, color: textColor),
          SizedBox(width: 10), // Add some space between icon and text
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    ),
  );
}
