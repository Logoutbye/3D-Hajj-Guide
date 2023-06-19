import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hajj_guide/Utils/constants.dart';
import 'package:hajj_guide/View/home_page.dart';
import 'package:hajj_guide/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
// for class diagram
// import 'package:dcdg/dcdg.dart';

Future main() async {
  // Be sure to add this line if initialize() call happens before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  fetchLinksFromFirebaseStorage();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
 RitualsLinks.lanaguage = prefs.getString('language');
  print('language::${RitualsLinks.lanaguage}');

  runApp(MyApp(language: RitualsLinks.lanaguage));
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
      locale: language == 'ur' ? Locale('ur', 'PK') : Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      home: const HomePage(),
    );
  }
}

fetchLinksFromFirebaseStorage() {
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child(
      "English/ritual1.mp4"); // change path to your video in Firebase Storage
  ref.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual1Link = fileURL;
  });

  Reference ref2 = storage.ref().child(
      "English/ritual2.mp4"); // change path to your video in Firebase Storage
  ref2.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual2Link = fileURL;
  });

  Reference ref3 = storage.ref().child(
      "English/ritual3.mp4"); // change path to your video in Firebase Storage
  ref3.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual3Link = fileURL;
  });

  Reference ref4 = storage.ref().child(
      "English/ritual4.mp4"); // change path to your video in Firebase Storage
  ref4.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual4Link = fileURL;
  });

  Reference ref5 = storage.ref().child(
      "English/ritual5.mp4"); // change path to your video in Firebase Storage
  ref5.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual5Link = fileURL;
  });

  Reference ref6 = storage.ref().child(
      "English/ritual6.mp4"); // change path to your video in Firebase Storage
  ref6.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual6Link = fileURL;
  });
  Reference ref7 = storage.ref().child(
      "English/ritual7.mp4"); // change path to your video in Firebase Storage
  ref7.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual7Link = fileURL;
  });
  Reference ref8 = storage.ref().child(
      "English/ritual8.mp4"); // change path to your video in Firebase Storage
  ref8.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual8Link = fileURL;
  });
  Reference ref9 = storage.ref().child(
      "English/ritual9.mp4"); // change path to your video in Firebase Storage
  ref9.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual9Link = fileURL;
  });
  Reference ref10 = storage.ref().child(
      "English/ritual10.mp4"); // change path to your video in Firebase Storage
  ref10.getDownloadURL().then((fileURL) {
    RitualsLinks.engRitual10Link = fileURL;
  });


  ///////////////////////////////////////
  // get links for urdu
    Reference ref11 = storage.ref().child(
      "Urdu/ritual1.mp4"); // change path to your video in Firebase Storage
  ref11.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual1Link = fileURL;
  });

    Reference ref12 = storage.ref().child(
      "Urdu/ritual2.mp4"); // change path to your video in Firebase Storage
  ref12.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual2Link = fileURL;
  });

  Reference ref13 = storage.ref().child(
      "Urdu/ritual3.mp4"); // change path to your video in Firebase Storage
  ref13.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual3Link = fileURL;
  });

   Reference ref14 = storage.ref().child(
      "Urdu/ritual4.mp4"); // change path to your video in Firebase Storage
  ref14.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual4Link = fileURL;
  });
  Reference ref15 = storage.ref().child(
      "Urdu/ritual5.mp4"); // change path to your video in Firebase Storage
  ref15.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual5Link = fileURL;
  });

  Reference ref16 = storage.ref().child(
      "Urdu/ritual6.mp4"); // change path to your video in Firebase Storage
  ref16.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual6Link = fileURL;
  });
  Reference ref17 = storage.ref().child(
      "Urdu/ritual7.mp4"); // change path to your video in Firebase Storage
  ref17.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual7Link = fileURL;
  });
  Reference ref18 = storage.ref().child(
      "Urdu/ritual8.mp4"); // change path to your video in Firebase Storage
  ref18.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual8Link = fileURL;
  });
  Reference ref19 = storage.ref().child(
      "Urdu/ritual9.mp4"); // change path to your video in Firebase Storage
  ref19.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual9Link = fileURL;
  });
  Reference ref20 = storage.ref().child(
      "Urdu/ritual10.mp4"); // change path to your video in Firebase Storage
  ref20.getDownloadURL().then((fileURL) {
    RitualsLinks.urRitual10Link = fileURL;
  });
}
