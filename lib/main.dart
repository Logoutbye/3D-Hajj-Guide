import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hajj_guide/View/home_page.dart';
import 'package:hajj_guide/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? language = prefs.getString('language');
  runApp(MyApp(language: language));
}

class MyApp extends StatelessWidget {
    final String? language;

    MyApp({Key? key, required this.language}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hajj Guide',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      translations: Languages(),
      locale:language=='ur'?  Locale('ur' , 'PK') :Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: const HomePage(),
    );
  }
}
