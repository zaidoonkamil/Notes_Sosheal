import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/local_auth_face.dart';
import '../../services/local_auth_finger.dart';
import '../pages/home_page.dart';
import 'build_button.dart';

Widget buildAuthenticateFinger(BuildContext context) => buildButton(
      text: 'Authenticate',
      icon: Icons.fingerprint,
      onClicked: () async {
        final isAuthenticated = await LocalAuthFinger.authenticate();

        if (isAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Get.to(HomePage());
        }
      },
    );

Widget buildAuthenticateFace(BuildContext context) => buildButton(
      text: 'Authenticate',
      icon: Icons.face_outlined,
      onClicked: () async {
        final isAuthenticated = await LocalAuthFace.authenticate();

        if (isAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Get.to(HomePage());
        }
      },
    );
