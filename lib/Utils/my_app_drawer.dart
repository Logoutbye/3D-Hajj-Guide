import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hajj_guide/View/Qibla/qibla.dart';
import 'package:mailto/mailto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../View/tasbhee.dart';
import 'constants.dart';

class MyAppDrawer extends StatefulWidget {
  const MyAppDrawer({super.key});

  @override
  State<MyAppDrawer> createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            SizedBox(height: 20,),
            const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ), //BoxDecoration
                child: Center(child: Text("Will Show App Icon here"))
                //  Image(image: AssetImage('assets/launcher_icon.png')),
                ),
            ExpansionTile(
              title: Text("select_Language".tr),
              leading: Icon(Icons.language,color: AppColors.kprimary,
                // size: 30,
                ), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text("English"),
                  onTap: () async {
                    //action on press
                    Get.updateLocale(Locale('en', 'US'));
    
                    //save which language is selected
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('language', 'en');
    
                    Navigator.of(context).pop();
                  },
                ),
    
                ListTile(
                  title: Text("اردو"),
                  onTap: () async {
                    //action on press
                    Get.updateLocale(Locale('ur', 'PK'));
                    //save which language is selected
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString('language', 'ur');
                    Navigator.of(context).pop();
                  },
                ),
    
                //more child menu
              ],
            ), //DrawerHeader
            ListTile(
              leading: Image.asset(
                'assets/icons/qibla.png',
                color: AppColors.kprimary,
                height: 35,
              ),
              title: Text('Qibla'.tr),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Qibla()));
              },
            ),
            Divider(
              color: AppColors.kBlack,
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/tasbih.png',
                color: AppColors.kprimary,
                height: 35,
              ),
              title: Text('Tasbhee'.tr),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TasbheeCounter()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.reviews,
                color: AppColors.kprimary,
                // size: 30,
              ),
              title: Text('Suggestions'.tr),
              onTap: () {
                funcOpenMailComposer();
              },
            ),
          ],
        ),
      ),
    );
  }

  void funcOpenMailComposer() async {
    final mailtoLink = Mailto(
      to: ['test@gmail.com'],
      cc: ['test12@gmail.com', 'test13@gmail.com'],
      subject: 'Suggestions for improvements in Hajj Guide App',
      body: 'AOA!\nI would Like to give review about',
    );
    await launch('$mailtoLink');
  }
}
