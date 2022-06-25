import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../styles/colors.dart';

Widget buildButton({
  required String text,
  required IconData icon,
  required VoidCallback onClicked,
}) =>
    ElevatedButton.icon(
      style:
      ElevatedButton.styleFrom(primary: Get.isDarkMode?Colors.grey:Colors.grey,
        minimumSize: Size.fromHeight(50),),
      icon: Icon(icon, size: 26, color:Get.isDarkMode?Colors.white:bgColor,),
      label: Text(
        text,
        style: TextStyle(fontSize: 20,color:Get.isDarkMode?Colors.white:bgColor),
      ),
      onPressed: onClicked,
    );