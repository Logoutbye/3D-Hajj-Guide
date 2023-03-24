import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hajj_guide/View/home_page.dart';
import 'package:hajj_guide/languages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: const HomePage(),
    );
  }
}
