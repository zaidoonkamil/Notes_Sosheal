import 'package:flutter/material.dart';

Widget buildText(String text, bool checked) => Container(
  margin: EdgeInsets.symmetric(vertical: 8),
  child: Row(
    children: [
      checked
          ? Icon(Icons.check, color: Colors.green, size: 24)
          : Icon(Icons.close, color: Colors.red, size: 24),
      const SizedBox(width: 12),
      Text(text, style: TextStyle(fontSize: 24)),
    ],
  ),
);