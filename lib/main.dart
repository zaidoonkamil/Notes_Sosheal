import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_note_app/core/db/db_helper.dart';
import 'package:flutter_note_app/services/theme_services.dart';
import 'package:flutter_note_app/theme.dart';
import 'package:flutter_note_app/ui/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Flutter Note App';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: title,
      debugShowCheckedModeBanner: false,
      home: logIn_page(),
    );
  }
}
