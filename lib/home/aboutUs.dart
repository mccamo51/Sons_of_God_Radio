import 'package:flutter/material.dart';
import 'package:sons_radio/components/colors.dart';
import 'package:sons_radio/components/strings.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TITL,
        centerTitle: true,
        title: Text("About Us"),
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/pastor.jpeg"),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
              Colors.white.withOpacity(0.9), BlendMode.lighten),
        )),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics,
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/back1.jpeg",
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          // SizedBox(
                          //   height: 15,
                          // ),
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
                          // Container(
                          //   height: 5,
                          //   width: 100,
                          //   color: Colors.white,
                          // ),
                          // SizedBox(height: 10),
                          // Text(
                          //   "ABOUT US ",
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 30),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$ABOUTTEXT",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "$ABOUT2",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "For prayers and counselling please contact us using the following channel:",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      "Telephone or Mobile: +233208357999",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      "Email: sogobim@gmail.com",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
