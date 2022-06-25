import 'package:flutter/material.dart';
import 'package:flutter_note_app/ui/styles/text_styles.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../services/local_auth_finger.dart';
import '../styles/colors.dart';
import '../widgets/build_auth.dart';
import '../widgets/build_button.dart';
import '../widgets/build_text.dart';

class logIn_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.theme.backgroundColor,
    appBar: AppBar(
      backgroundColor: context.theme.backgroundColor,
      title:Text(
        "NotesShow",
        style: titleTextStyle.copyWith(fontSize: 26,color:Get.isDarkMode?Colors.white:bgColor),
      ),
      elevation: 0,
    ),
    body: Padding(
      padding: EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAvailability(context),
            SizedBox(height: 30),
            buildAuthenticateFinger(context),
            SizedBox(height: 10),
            buildAuthenticateFace(context),
          ],
        ),
      ),
    ),
  );

  Widget buildAvailability(BuildContext context) => buildButton(
    text: 'Check Availability',
    icon: Icons.event_available,
    onClicked: () async {
      final isAvailable = await LocalAuthFinger.hasBiometrics();
      final biometrics = await LocalAuthFinger.getBiometrics();
      final hasFingerprint = biometrics.contains(BiometricType.fingerprint);
      final hasFaceprint = biometrics.contains(BiometricType.face);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Availability'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildText('Biometrics ', isAvailable),
              buildText('Fingerprint', hasFingerprint),
              buildText('Faceprint', hasFaceprint),
            ],
          ),
        ),
      );
    },
  );

}