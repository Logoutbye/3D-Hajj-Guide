// import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Model extends StatefulWidget {
  const Model({super.key});

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: 500,
                child: ModelViewer(
                  src:
                      // 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                      // 'https://github.com/Logoutbye/firebase_notification/blob/master/lib/Astronaut.glb',
                      // 'assets/Astronaut.glb',
                      'assets/al-kaaba_edited.glb',
                  backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                  alt: "A 3D model of an astronaut",
                  ar: true,
                  // arModes: ['scene-viewer', 'webxr', 'quick-look'],
                  autoRotate: true,
                  cameraControls: true,
                  disableZoom: false,
                ),
              ),
              Container(
                height: 500,
                child: HtmlWidget(
                  '<div class="sketchfab-embed-wrapper"> <iframe title="Mina" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/aa0f6efcdde94437a6cc9ad046ae123a/embed"> </iframe> <p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4A4A4A;"> <a href="https://sketchfab.com/3d-models/mina-aa0f6efcdde94437a6cc9ad046ae123a?utm_medium=embed&utm_campaign=share-popup&utm_content=aa0f6efcdde94437a6cc9ad046ae123a" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> Mina </a> by <a href="https://sketchfab.com/kaaba?utm_medium=embed&utm_campaign=share-popup&utm_content=aa0f6efcdde94437a6cc9ad046ae123a" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;"> kaaba </a> on <a href="https://sketchfab.com?utm_medium=embed&utm_campaign=share-popup&utm_content=aa0f6efcdde94437a6cc9ad046ae123a" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p></div>',
                ),
              ),
            ],
          ),
        ));
  }
}
