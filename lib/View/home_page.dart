// import 'package:babylonjs_viewer/babylonjs_viewer.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajj_guide/Utils/constants.dart';
import 'package:hajj_guide/View/model_viewer.dart';
import 'package:hajj_guide/View/sketchFab.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kWhite,
        appBar: AppBar(
          backgroundColor: AppColors.ksecondary,
          foregroundColor: AppColors.kprimary,
          title: Text("app_bar".tr),
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ), //BoxDecoration
                  child: Center(child: Text("Will Show App Icon here"))
                  //  Image(image: AssetImage('assets/launcher_icon.png')),
                  ),
              ExpansionTile(
                title: Text("select_Language".tr),
                leading: Icon(Icons.language), //add icon
                childrenPadding: EdgeInsets.only(left: 60), //children padding
                children: [
                  ListTile(
                    title: Text("English"),
                    onTap: () {
                      //action on press
                      Get.updateLocale(Locale('en', 'US'));

                      Navigator.of(context).pop();
                    },
                  ),

                  ListTile(
                    title: Text("اردو"),
                    onTap: () {
                      //action on press
                      Get.updateLocale(Locale('ur', 'PK'));
                      Navigator.of(context).pop();
                    },
                  ),

                  //more child menu
                ],
              ), //DrawerHeader
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text(' Help '),
                onTap: () {},
              ),
              Divider(
                color: AppColors.kBlack,
              ),
              ListTile(
                leading: const Icon(Icons.share),
                title: const Text(' Share '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.reviews),
                title: const Text(' Suggestions '),
                onTap: () {
                  funcOpenMailComposer();

                  // launch('mailto:raja123@gmail.com?subject=this is subject,Title&body=This is body');
                },
              ),
            ],
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpeg'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.softLight)),
          ),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: 'ihram',)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage("assets/icons/ihram.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Ihram and Intentions".tr
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: 'tents',)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage("assets/icons/tent.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Mina aka “City of tents”".tr
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: "mina",)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/icons/mount-arafat.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Mina to Arafat".tr
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: 'muzdalifah',)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage(
                                              "assets/icons/night-mode.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Muzdalifah".tr
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: 'rami',)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage("assets/icons/throw.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Rami".tr
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(src: 'nahr',)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/icons/sheep.png"),
                                              size: 50,
                                            ),
                                            Text(" + "),
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/icons/hair-cut.png"),
                                              size: 50,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Nahr".tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SketchFAb(
                                            src: 'farewell',
                                          )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ImageIcon(
                                          AssetImage("assets/icons/tawaf.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Farewell Tawaf".tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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

  // Future<void> _showSimpleDialog() async {
  //   await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return SimpleDialog(
  //           title: Text('select_Language'.tr),
  //           children: <Widget>[
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 Get.updateLocale(Locale('ur', 'PK'));
  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('اردو'),
  //             ),
  //             SimpleDialogOption(
  //               onPressed: () {
  //                 Get.updateLocale(Locale('en', 'US'));

  //                 Navigator.of(context).pop();
  //               },
  //               child: const Text('English'),
  //             ),
  //           ],
  //         );
  //       });
  // }

}
