import 'dart:io';

import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sons_radio/components/colors.dart';
import 'package:sons_radio/components/functions.dart';
import 'package:sons_radio/components/strings.dart';
import 'package:sons_radio/home/aboutUs.dart';
import 'package:sons_radio/home/supportUs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlugin = AudioPlayer();
  bool isPlaying = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlugin.play("http://stream.zeno.fm/x4qesqszkwzuv");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TITL,
      appBar: AppBar(
        centerTitle: true,
        leading: Image.asset(
          "assets/images/logo.png",
          width: 20,
          height: 20,
        ),
        backgroundColor: TITL,
        title: Text("Sons of God Radio"),
        actions: [
          IconButton(
            onPressed: () {
              audioPlugin.stop();
              Navigator.of(context).pop();
            },
            icon: Row(
              children: [
                Text(
                  "EXIT",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.red,
                  ),
                ),
                Icon(
                  Icons.arrow_left_outlined,
                  size: 40,
                  color: Colors.red,
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back2.jpeg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Text(
              //   "WELCOME TO ",
              //   style: TextStyle(
              //       color: WELCOMCOLOR,
              //       fontWeight: FontWeight.w500,
              //       fontSize: 30),
              // ),
              // Text(
              //   "SONS OF GOD \nRADIO",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       height: 1.2,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30),
              // ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: Image.asset(
                  "assets/images/studio.jpeg",
                  // width: MediaQuery.of(context).size.width / 1.6,
                ),
              ),
              // Container(
              //   height: 5,
              //   width: 100,
              //   color: Colors.white,
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Container(
                height: 70,
                color: PLAY,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 9,
                      width: 9,
                    ),
                    Text(
                      isPlaying ? "PLAYING" : "PAUSED",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                          if (!isPlaying) {
                            audioPlugin.pause();
                          } else {
                            audioPlugin
                                .play("http://stream.zeno.fm/x4qesqszkwzuv");
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonBut(
                          context: context,
                          image: "assets/images/fb.png",
                          title: "Facebook",
                          onTap: () => fbPage(),
                        ),
                        _buttonBut(
                            context: context,
                            image: "assets/images/you.png",
                            title: "Youtube",
                            colr: Colors.red[500],
                            onTap: () => youtubelaunchURL()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonBut(
                          context: context,
                          image: "assets/images/wats.png",
                          title: "WhatsApp",
                          colr: Colors.green,
                          onTap: () => whatsapplaunch(
                              "https://chat.whatsapp.com/BymIyHPBmPOHZrzJMmyJFh"),
                        ),
                        _buttonBut(
                            context: context,
                            colr: Colors.white,
                            image: "assets/images/placeholder.png",
                            title: "Location",
                            onTap: () => launchURLMap()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonBut(
                            context: context,
                            image: "assets/images/momo.png",
                            title: "Support Us",
                            onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SupportUs()))),
                        _buttonBut(
                            context: context,
                            image: "assets/images/info.png",
                            title: "About Us",
                            onTap: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => AboutUs()))),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buttonBut({
    BuildContext context,
    Function onTap,
    String image,
    String title,
    Color colr = Colors.amber,
  }) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2.2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red, width: 3),
        ),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                color: colr,
                child: Image.asset(
                  "$image",
                  height: 45,
                  width: 45,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "$title",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height > 600 ? 15 : 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
