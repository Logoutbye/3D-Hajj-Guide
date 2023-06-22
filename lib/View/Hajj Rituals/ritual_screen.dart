import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajj_guide/Utils/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class RitualScreen extends StatefulWidget {
  String src;
  RitualScreen({required this.src, super.key});

  @override
  State<RitualScreen> createState() => _RitualScreenState();
}

class _RitualScreenState extends State<RitualScreen> {
  final audioPlayer = AudioPlayer(); //if auido is playing
  Duration postion = Duration.zero; //postion from where it is playing
  Duration duration = Duration.zero; // total duration of the song

  //source for which ritual is selected
  var scr;
  late VideoPlayerController _controller;
  bool _isVideoPlaying = false;
  bool isPlaying = false;
  @override
  void initState() {
    print(';;;;;;${RitualsLinks.lanaguage}');
    print(';;;${RitualsLinks.engRitual1Link}');
    _initializeVideo();
    super.initState();
    scr = widget.src;
    // getAudio();
    // //listen to the states: playing ,paused,stopped
    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });
    // });
    // //to detect audio Duration
    // audioPlayer.onDurationChanged.listen((newDuration) {
    //   setState(() {
    //     duration = newDuration;
    //   });
    // });
    // //to detect audio Postion
    // audioPlayer.onPositionChanged.listen((newPostion) {
    //   setState(() {
    //     postion = newPostion;
    //   });
    // });

    super.initState();
  }

  // getlanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   language = prefs.getString('language');
  // }

  void _initializeVideo() {
    // _controller = VideoPlayerController.network(RitualsLinks.engRitual1Link!)
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });

    ////////////////
    if (RitualsLinks.lanaguage == 'ur') {
      _controller = VideoPlayerController.network(widget.src == 'ritual1'
          ? RitualsLinks.urRitual1Link!
          : widget.src == 'ritual2'
              ? RitualsLinks.urRitual2Link!
              : widget.src == 'ritual3'
                  ? RitualsLinks.urRitual3Link!
                  : widget.src == 'ritual4'
                      ? RitualsLinks.urRitual4Link!
                      : widget.src == 'ritual5'
                          ? RitualsLinks.urRitual5Link!
                          : widget.src == 'ritual6'
                              ? RitualsLinks.urRitual6Link!
                              : widget.src == 'ritual7'
                                  ? RitualsLinks.urRitual7Link!
                                  : '')
        ..initialize().then((_) {
          setState(() {});
          // _controller.play();
          // _isVideoPlaying = true;
        });
    } else {
      _controller = VideoPlayerController.network(widget.src == 'ritual1'
          ? RitualsLinks.engRitual1Link!
          : widget.src == 'ritual2'
              ? RitualsLinks.engRitual2Link!
              : widget.src == 'ritual3'
                  ? RitualsLinks.engRitual3Link!
                  : widget.src == 'ritual4'
                      ? RitualsLinks.engRitual4Link!
                      : widget.src == 'ritual5'
                          ? RitualsLinks.engRitual5Link!
                          : widget.src == 'ritual6'
                              ? RitualsLinks.engRitual6Link!
                              : widget.src == 'ritual7'
                                  ? RitualsLinks.engRitual7Link!
                                  : '')
        ..initialize().then((_) {
          setState(() {});
          // _controller.play();
          // _isVideoPlaying = true;
        });
    }
  }

  Future<void> _playNextVideo() async {
    _isVideoPlaying = false;
    _controller.pause();

    if (RitualsLinks.lanaguage == 'ur') {
      _controller = VideoPlayerController.network(widget.src == 'ritual1'
          ? RitualsLinks.urRitual1Link!
          : widget.src == 'ritual2'
              ? RitualsLinks.urRitual2Link!
              : widget.src == 'ritual3'
                  ? RitualsLinks.urRitual3Link!
                  : widget.src == 'ritual4'
                      ? RitualsLinks.urRitual4Link!
                      : widget.src == 'ritual5'
                          ? RitualsLinks.urRitual5Link!
                          : widget.src == 'ritual6'
                              ? RitualsLinks.urRitual6Link!
                              : widget.src == 'ritual7'
                                  ? RitualsLinks.urRitual7Link!
                                  : '')
        ..initialize().then((_) {
          setState(() {});
          // _controller.play();
          // _isVideoPlaying = true;
        });
    } else {
      _controller = VideoPlayerController.network(widget.src == 'ritual1'
          ? RitualsLinks.engRitual1Link!
          : widget.src == 'ritual2'
              ? RitualsLinks.engRitual2Link!
              : widget.src == 'ritual3'
                  ? RitualsLinks.engRitual3Link!
                  : widget.src == 'ritual4'
                      ? RitualsLinks.engRitual4Link!
                      : widget.src == 'ritual5'
                          ? RitualsLinks.engRitual5Link!
                          : widget.src == 'ritual6'
                              ? RitualsLinks.engRitual6Link!
                              : widget.src == 'ritual7'
                                  ? RitualsLinks.engRitual7Link!
                                  : '')
        ..initialize().then((_) {
          setState(() {});
          // _controller.play();
          // _isVideoPlaying = true;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.kprimary,
        backgroundColor: AppColors.ksecondary,
        //  title will be selected on the basis on which screen it is on
        title: Text(widget.src == 'ritual1'
            ? "Ihram and Intentions".tr
            : widget.src == 'ritual2'
                ? "Mina aka “City of tents”".tr
                : widget.src == 'ritual3'
                    ? "Mina to Arafat".tr
                    : widget.src == 'ritual4'
                        ? "Muzdalifah".tr
                        : widget.src == 'ritual5'
                            ? "Rami".tr
                            : widget.src == 'ritual6'
                                ? "Nahr".tr
                                : widget.src == 'ritual7'
                                    ? "Farewell Tawaf".tr
                                    : ''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            //setting next screen
            child: IconButton(
                onPressed: () async {
                  setState(() {
                    widget.src == 'ritual1'
                        ? widget.src = 'ritual2'
                        : widget.src == 'ritual2'
                            ? widget.src = 'ritual3'
                            : widget.src == 'ritual3'
                                ? widget.src = 'ritual4'
                                : widget.src == 'ritual4'
                                    ? widget.src = 'ritual5'
                                    : widget.src == 'ritual5'
                                        ? widget.src = 'ritual6'
                                        : widget.src == 'ritual6'
                                            ? widget.src = 'ritual7'
                                            : widget.src = 'ritual1';
                    // postion = Duration.zero;

                    _playNextVideo();
                  });
                  // audioPlayer.stop();
                  // if (isPlaying) {
                  //   await audioPlayer.stop();
                  // }
                  // getAudio();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                },
                icon: Icon(Icons.arrow_forward)),
          )
        ],
      ),
      body: Column(
        children: [
          // HtmlWidget(widget.src == 'ihram'
          //     ? '<iframe width="640" height="480" src="https://sketchfab.com/playlists/embed?collection=51f5f213f15e4d9d838acaf26823e074&autostart=1"title="ihram"frameborder="0"allowfullscreenmozallowfullscreen="true" webkitallowfullscreen="true"allow="autoplay; fullscreen; xr-spatial-tracking"xr-spatial-trackingexecution-while-out-of-viewportexecution-while-not-renderedweb-share></iframe><p style="font-family: sans-serif;font-size: 0px; font-weight: normal; margin: 5px; color: #4A4A4A;"><a href="https://sketchfab.com/dudesyntax/collections/ihram-51f5f213f15e4d9d838acaf26823e074" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">ihram</a>by <a href="https://sketchfab.com/dudesyntax" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">dudesyntax</a>on <a href="https://sketchfab.com?utm_source=website&utm_medium=embed&utm_campaign=share-popup" target="_blank" rel="nofollow" style="font-weight: bold; color: #1CAAD9;">Sketchfab</a></p>'
          //     : widget.src == 'tents'
          //         ? '<div class="sketchfab-embed-wrapper"> <iframe title="Mina" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/aa0f6efcdde94437a6cc9ad046ae123a/embed?autospin=1&autostart=1"> </iframe> </div>'
          //         : widget.src == 'mina'
          //             ? '<div class="sketchfab-embed-wrapper"> <iframe title="Arafah" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/8971a7f14c0c427cb25771e6acbfd044/embed?autospin=1&autostart=1&annotations_visible=0"> </iframe> </div>'
          //             : widget.src == 'muzdalifah'
          //                 ? '<div class="sketchfab-embed-wrapper"> <iframe title="Muzdalifah" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/85647ba0d0724c159cfe9f3f3dce4d04/embed?autospin=1&autostart=1"> </iframe> </div>'
          //                 : widget.src == 'rami'
          //                     ? '<div class="sketchfab-embed-wrapper"> <iframe title="Jamarat" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/1cf72bc1188a49d38bec26db53121fd7/embed?autospin=1&autostart=1"> </iframe> </div>'
          //                     : widget.src == 'nahr'
          //                         ? ''
          //                         : widget.src == 'farewell'
          //                             ? '<div class="sketchfab-embed-wrapper"> <iframe title="Kaaba" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/45d4b0b4404a4ad7b3f7235f7a10382c/embed?autospin=1&autostart=1"> </iframe> </div>'
          //                             : ''),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: Center(
              child: _controller.value.isInitialized
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              VideoPlayer(_controller),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: VideoProgressIndicator(
                            allowScrubbing: true,
                            _controller,
                            padding: EdgeInsets.all(8.0),
                          ),
                        )
                      ],
                    )
                  : CircularProgressIndicator(),
                  //  Lottie.asset('assets/hajj_loading.json',height: MediaQuery.of(context).size.height/4),
            ),
          ),
          //setting description or guide line
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.src == 'ritual1'
                        ? Text('step1'.tr)
                        : widget.src == 'ritual2'
                            ? Text('step2'.tr)
                            : widget.src == 'ritual3'
                                ? Text('step3'.tr)
                                : widget.src == 'ritual4'
                                    ? Text('step4'.tr)
                                    : widget.src == 'ritual5'
                                        ? Text('step5'.tr)
                                        : widget.src == 'ritual6'
                                            ? Text('step6'.tr)
                                            : widget.src == 'ritual7'
                                                ? Text('step7'.tr)
                                                : Text("Sorry"))),
          ),
        ],
      ),
      //auido at bottom
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: MediaQuery.of(context).size.height / 10,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.ksecondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Padding(
            // padding: const EdgeInsets.all(8.0),
            // child: Text("Title",
            //     style: TextStyle(
            //       color: Colors.black,
            //     ))),
            // Slider(
            //   min: 0,
            //   max: duration.inSeconds.toDouble(),
            //   value: postion.inSeconds
            //       .toDouble()
            //       .clamp(0, duration.inSeconds.toDouble()),
            //   onChanged: (value) async {
            //     final position = Duration(seconds: value.toInt());
            //     await audioPlayer.seek(position);
            //     await audioPlayer.resume();
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                          _isVideoPlaying ? Icons.pause : Icons.play_arrow),
                      onPressed: () async {
                        setState(() {
                          _isVideoPlaying
                              ? _controller.pause()
                              : _controller.play();
                          _isVideoPlaying = !_isVideoPlaying;
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      icon: Icon(isMuted ? Icons.volume_mute : Icons.volume_up),
                      onPressed: () async {
                        setState(() {
                          _controller.setVolume(isMuted ? 1 : 0);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future getAudio() async {
  //   // load file from assets
  //   final player = AudioCache(prefix: 'assets/audios/');
  //   setState(() async {
  //     //get the lanaguage stored in sharedprefrences
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String? language = prefs.getString('language');
  //     print("${language}");
  //     //first check which langage then check which screen
  //     final url = language == 'en'
  //         ? await player.load(widget.src == 'ihram'
  //             ? 'test.mp3'
  //             : widget.src == 'tents'
  //                 ? '1.mpeg'
  //                 : widget.src == 'mina'
  //                     ? '2.mpeg'
  //                     : widget.src == 'muzdalifah'
  //                         ? '3.mpeg'
  //                         : widget.src == 'rami'
  //                             ? '4.mpeg'
  //                             : widget.src == 'nahr'
  //                                 ? '5.mpeg'
  //                                 : widget.src == 'farewell'
  //                                     ? '6.mpeg'
  //                                     : '')
  //         : await player.load(widget.src == 'ihram'
  //             ? 'step1-ur.mp3'
  //             : widget.src == 'tents'
  //                 ? 'step2-ur.mp3'
  //                 : widget.src == 'mina'
  //                     ? 'step3-ur.mp3'
  //                     : widget.src == 'muzdalifah'
  //                         ? 'step4-ur.mp3'
  //                         : widget.src == 'rami'
  //                             ? 'step5-ur.mp3'
  //                             : widget.src == 'nahr'
  //                                 ? 'step6-ur.mp3'
  //                                 : widget.src == 'farewell'
  //                                     ? 'step7-ur.mp3'
  //                                     : '');
  //                                     setState(() {
  //                                     });
  //     audioPlayer.setSourceUrl(url.path);
  //   });
  // }

  // Future<void> getAudio() async {
  //   final player = AudioCache(prefix: 'assets/audios/');
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? language = prefs.getString('language');
  //   final url = language == 'en'
  //       ? await player.load(widget.src == 'ihram'
  //           ? 'test.mp3'
  //           : widget.src == 'tents'
  //               ? '1.mpeg'
  //               : widget.src == 'mina'
  //                   ? '2.mpeg'
  //                   : widget.src == 'muzdalifah'
  //                       ? '3.mpeg'
  //                       : widget.src == 'rami'
  //                           ? '4.mpeg'
  //                           : widget.src == 'nahr'
  //                               ? '5.mpeg'
  //                               : widget.src == 'farewell'
  //                                   ? '6.mpeg'
  //                                   : '')
  //       : await player.load(widget.src == 'ihram'
  //           ? 'step1-ur.mp3'
  //           : widget.src == 'tents'
  //               ? 'step2-ur.mp3'
  //               : widget.src == 'mina'
  //                   ? 'step3-ur.mp3'
  //                   : widget.src == 'muzdalifah'
  //                       ? 'step4-ur.mp3'
  //                       : widget.src == 'rami'
  //                           ? 'step5-ur.mp3'
  //                           : widget.src == 'nahr'
  //                               ? 'step6-ur.mp3'
  //                               : widget.src == 'farewell'
  //                                   ? 'step7-ur.mp3'
  //                                   : '');

  //   setState(() {
  //     audioPlayer.setSourceUrl(url.path);
  //   });
  // }

  // String formatTime(Duration duration) {
  //   String twodigits(int n) => n.toString().padLeft(2, '0');
  //   final hours = twodigits(duration.inHours);
  //   final minutes = twodigits(duration.inMinutes.remainder(60));
  //   final seconds = twodigits(duration.inSeconds.remainder(60));
  //   return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  // }

  @override
  void dispose() {
    audioPlayer.dispose();
    _controller.dispose();

    super.dispose();
  }
}
