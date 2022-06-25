import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/styles/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData(
    primaryColor: Colors.white,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: bgColor,
    backgroundColor: bgColor,
    brightness: Brightness.dark,
  );
}
