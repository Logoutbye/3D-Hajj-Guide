import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:hajj_guide/Utils/constants.dart';

class SketchFAb extends StatefulWidget {
  String src;
  SketchFAb({required this.src, super.key});

  @override
  State<SketchFAb> createState() => _SketchFAbState();
}

class _SketchFAbState extends State<SketchFAb> {
  final audioPlayer = AudioPlayer(); //if auido is playing
  Duration postion = Duration.zero; //postion from where it is playing
  Duration duration = Duration.zero; // total duration of the song

  //sorce for 3d model
  var scr;

  bool isPlaying = false;
  @override
  void initState() {
    scr = widget.src;
    getAudio();

    //listen to the states: playing ,paused,stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //to detect audio Duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    //to detect audio Postion
    audioPlayer.onPositionChanged.listen((newPostion) {
      setState(() {
        postion = newPostion;
      });
    });
    // audioPlayer.stop();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // audioPlayer.stop();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.kprimary,
        backgroundColor: AppColors.ksecondary,
        title: Text(widget.src == 'ihram'
            ? "Ihram and Intentions".tr
            : widget.src == 'tents'
                ? "Mina aka “City of tents”".tr
                : widget.src == 'mina'
                    ? "Mina to Arafat".tr
                    : widget.src == 'muzdalifah'
                        ? "Muzdalifah".tr
                        : widget.src == 'rami'
                            ? "Rami".tr
                            : widget.src == 'nahr'
                                ? "Nahr".tr
                                : widget.src == 'farewell'
                                    ? "Farewell Tawaf".tr
                                    : ''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () async {
                  setState(() {
                    widget.src == 'ihram'
                        ? widget.src = 'tents'
                        : widget.src == 'tents'
                            ? widget.src = 'mina'
                            : widget.src == 'mina'
                                ? widget.src = 'muzdalifah'
                                : widget.src == 'muzdalifah'
                                    ? widget.src = 'rami'
                                    : widget.src == 'rami'
                                        ? widget.src = 'nahr'
                                        : widget.src == 'nahr'
                                            ? widget.src = 'farewell'
                                            : widget.src = 'ihram';
                  });
                  // audioPlayer.stop();
                  if (isPlaying) {
                    await audioPlayer.dispose();
                  }
                  getAudio();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                icon: Icon(Icons.arrow_forward)),
          )
        ],
      ),
      body: Column(
        children: [
          HtmlWidget(widget.src == 'ihram'
              ? '<iframe width="640" height="480" src="https://sketchfab.com/playlists/embed?collection=51f5f213f15e4d9d838acaf26823e074&autostart=1"title="ihram"frameborder="0"allowfullscreenmozallowfullscreen="true" webkitallowfullscreen="true"allow="autoplay; fullscreen; xr-spatial-tracking"xr-spatial-trackingexecution-while-out-of-viewportexecution-while-not-renderedweb-share></iframe><p style="font-family: sans-serif;font-size: 0px; font-weight: normal; margin: 5px; color: #4A4A4A;"><a href="https://sketchfab.com/dudesyntax/collections/ihram-51f5f213f15e4d9d838acaf26823e074" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">ihram</a>by <a href="https://sketchfab.com/dudesyntax" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">dudesyntax</a>on <a href="https://sketchfab.com?utm_source=website&utm_medium=embed&utm_campaign=share-popup" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p>'
              : widget.src == 'tents'
                  ? '<div class="sketchfab-embed-wrapper"> <iframe title="Mina" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/aa0f6efcdde94437a6cc9ad046ae123a/embed?autospin=1&autostart=1"> </iframe> </div>'
                  : widget.src == 'mina'
                      ? '<div class="sketchfab-embed-wrapper"> <iframe title="Arafah" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/8971a7f14c0c427cb25771e6acbfd044/embed?autospin=1&autostart=1&annotations_visible=0"> </iframe> </div>'
                      : widget.src == 'muzdalifah'
                          ? '<div class="sketchfab-embed-wrapper"> <iframe title="Muzdalifah" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/85647ba0d0724c159cfe9f3f3dce4d04/embed?autospin=1&autostart=1"> </iframe> </div>'
                          : widget.src == 'rami'
                              ? '<div class="sketchfab-embed-wrapper"> <iframe title="Jamarat" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/1cf72bc1188a49d38bec26db53121fd7/embed?autospin=1&autostart=1"> </iframe> </div>'
                              : widget.src == 'nahr'
                                  ? ''
                                  : widget.src == 'farewell'
                                      ? '<div class="sketchfab-embed-wrapper"> <iframe title="Kaaba" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/45d4b0b4404a4ad7b3f7235f7a10382c/embed?autospin=1&autostart=1"> </iframe> </div>'
                                      : ''),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "The Kaaba (“The Cube”), also referred as al-Kaʿbah al-Musharrafah (the Holy Kaaba), is a building at the center of Islam’s most important mosque, that is Al-Masjid Al-Ḥarām (The Sacred Mosque), in the Hejazi city of Mecca, Saudi Arabia. It is the most sacred site in Islam. It is considered by Muslims to be the Bayṫ Allāh (“House of God”)"),
          )
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 5,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.ksecondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Title",
                    style: TextStyle(
                      color: Colors.black,
                    ))),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble() < 20
                    ? 20
                    : duration.inSeconds.toDouble(),
                value: postion.inSeconds.toDouble(),
                onChanged: (Value) async {
                  final position = Duration(seconds: Value.toInt());

                  await audioPlayer.seek(position);

                  //optionally play audio if was paused
                  await audioPlayer.resume();
                }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(postion)),
                  Text(formatTime(duration))
                ],
              ),
            ),
            CircleAvatar(
              radius: 25,
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getAudio() async {
    // load file from assets
    final player = AudioCache(prefix: 'assets/audios/');
    setState(() async {
      final url = await player.load(widget.src == 'ihram'
          ? 'test.mp3'
          : widget.src == 'tents'
              ? '1.mpeg'
              : widget.src == 'mina'
                  ? '2.mpeg'
                  : widget.src == 'muzdalifah'
                      ? '3.mpeg'
                      : widget.src == 'rami'
                          ? '4.mpeg'
                          : widget.src == 'nahr'
                              ? '5.mpeg'
                              : widget.src == 'farewell'
                                  ? '6.mpeg'
                                  : '');
      audioPlayer.setSourceUrl(url.path);
    });
  }

  String formatTime(Duration duration) {
    String twodigits(int n) => n.toString().padLeft(2, '0');
    final hours = twodigits(duration.inHours);
    final minutes = twodigits(duration.inMinutes.remainder(60));
    final seconds = twodigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
