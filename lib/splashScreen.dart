import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sons_radio/home/home.dart';

import 'components/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Repo _repo = Repo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //   image: AssetImage("assets/images/back.jpeg"),
        //   fit: BoxFit.cover,
        //   colorFilter: new ColorFilter.mode(
        //       Colors.black.withOpacity(0.9), BlendMode.darken),
        // )),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.png",
                height: 200,
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
