import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajj_guide/Utils/my_app_drawer.dart';
import 'package:hajj_guide/View/Qibla/qibla.dart';
import 'package:hajj_guide/View/Hajj%20Rituals/haj_guide_screen.dart';
import 'package:hajj_guide/View/hajj_check_list.dart';
import '../Utils/constants.dart';

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
        drawer: MyAppDrawer(),
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
                          // first two button
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 2.5,
                            decoration: BoxDecoration(
                                color: AppColors.ksecondary,
                                borderRadius: BorderRadius.circular(29)),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HajGuideScreen()));
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
                                              "assets/icons/hajguide.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Hajj Guide".tr),
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
                                      builder: (context) => Qibla()));
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
                                          AssetImage("assets/icons/qibla.png"),
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Qibla Location Finder".tr),
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
                                      builder: (context) => HajjChecklist()));
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
                                        Icon(
                                          Icons.checklist_outlined,
                                          size: 72,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("Hajj Check List".tr),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          // SizedBox(
                          //   width: MediaQuery.of(context).size.width / 40,
                          // ),
                          // Container(
                          //   height: MediaQuery.of(context).size.height / 5,
                          //   width: MediaQuery.of(context).size.width / 2.5,
                          //   decoration: BoxDecoration(
                          //       color: AppColors.ksecondary,
                          //       borderRadius: BorderRadius.circular(29)),
                          //   child: TextButton(
                          //       onPressed: () {
                          //         Navigator.of(context).push(MaterialPageRoute(
                          //             builder: (context) => SketchFAb(
                          //                   src: 'muzdalifah',
                          //                 )));
                          //       },
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Center(
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.center,
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               ImageIcon(
                          //                 AssetImage(
                          //                     "assets/icons/night-mode.png"),
                          //                 size: 72,
                          //               ),
                          //               SizedBox(
                          //                 height: 10,
                          //               ),
                          //               Text("Muzdalifah".tr),
                          //             ],
                          //           ),
                          //         ),
                          //       )),
                          // ),
                        ],
                      ),
                    ),

                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width / 40,
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         height: MediaQuery.of(context).size.height / 5,
                    //         width: MediaQuery.of(context).size.width / 2.5,
                    //         decoration: BoxDecoration(
                    //             color: AppColors.ksecondary,
                    //             borderRadius: BorderRadius.circular(29)),
                    //         child: TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) => SketchFAb(
                    //                         src: 'rami',
                    //                       )));
                    //             },
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Center(
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     ImageIcon(
                    //                       AssetImage("assets/icons/throw.png"),
                    //                       size: 72,
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     Text("Rami".tr),
                    //                   ],
                    //                 ),
                    //               ),
                    //             )),
                    //       ),
                    //       SizedBox(
                    //         width: MediaQuery.of(context).size.width / 40,
                    //       ),
                    //       Container(
                    //         height: MediaQuery.of(context).size.height / 5,
                    //         width: MediaQuery.of(context).size.width / 2.5,
                    //         decoration: BoxDecoration(
                    //             color: AppColors.ksecondary,
                    //             borderRadius: BorderRadius.circular(29)),
                    //         child: TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) => SketchFAb(
                    //                         src: 'nahr',
                    //                       )));
                    //             },
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Center(
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     Row(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.center,
                    //                       mainAxisAlignment:
                    //                           MainAxisAlignment.center,
                    //                       children: [
                    //                         ImageIcon(
                    //                           AssetImage(
                    //                               "assets/icons/sheep.png"),
                    //                           size: 50,
                    //                         ),
                    //                         Text(" + "),
                    //                         ImageIcon(
                    //                           AssetImage(
                    //                               "assets/icons/hair-cut.png"),
                    //                           size: 50,
                    //                         ),
                    //                       ],
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     Text(
                    //                       "Nahr".tr,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.width / 40,
                    // ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         height: MediaQuery.of(context).size.height / 5,
                    //         width: MediaQuery.of(context).size.width / 2.5,
                    //         decoration: BoxDecoration(
                    //             color: AppColors.ksecondary,
                    //             borderRadius: BorderRadius.circular(29)),
                    //         child: TextButton(
                    //             onPressed: () {
                    //               Navigator.of(context).push(MaterialPageRoute(
                    //                   builder: (context) => SketchFAb(
                    //                         src: 'farewell',
                    //                       )));
                    //             },
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(8.0),
                    //               child: Center(
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.center,
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.center,
                    //                   children: [
                    //                     ImageIcon(
                    //                       AssetImage("assets/icons/tawaf.png"),
                    //                       size: 72,
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     Text(
                    //                       "Farewell Tawaf".tr,
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             )),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
